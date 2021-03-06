class ArticlesController < ApplicationController
  before_filter :authenticate_writer, only: [:new, :edit, :update, :destroy]
  before_action :set_articles, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user

    if params[:tag]
      @articles = Article.tagged_with(params[:tag])
    else
      @articles = Article.where('publish_at < ?', "%#{DateTime.current()}%").order(created_at: :desc)
    end
  end

  def show
    if @article.access?(current_user)
      @article.increase_visits
      render :show
    else
      redirect_to action: 'index', controller: 'articles'
    end
  end

  def new
    @user = current_user
    @article = @user.articles.new
  end

  def edit
    if @article.access?(current_user)
      render :edit
    else
      redirect_to action: 'index', controller: 'articles'
    end
  end

  def create
    @article = Article.new(articles_params)
    @article.user_id = current_user.id
    @article.publish_at = params[:datetimepicker].to_datetime
    @article.categories << Category.find_by(name: params['category'])

    if @article.save
      current_user.articles << @article
      redirect_to action: 'index', controller: 'articles'
    else
      render :new
    end
  end

  def update
    if @article.update(articles_params)
      redirect_to action: 'index', controller: 'articles'
    else
      render :edit
    end
  end

  def destroy
    if @article.owner?(current_user)
      @article.destroy
    end
    redirect_to articles_url
  end

  def section
    @user = current_user
    @articles = Category.find_by(id: params[:id]).articles.where('publish_at < ?', "%#{DateTime.current}%").order(created_at: :desc)
    render 'index'
  end

  def search
    @user = current_user
    @articles_all = Article.where('publish_at < ?', "%#{DateTime.current}%").order(created_at: :desc)

    @articles = []
    @titles = @articles_all.pluck(:title)

    @titles.each_with_index do |title, index|
      @articles << @articles_all[index] if title.downcase.include?(params[:value].downcase)
    end

    render 'index'
  end

  def author
    @articles = Article.where(user_id: params[:id]).where('publish_at < ?', "%#{DateTime.current}%").order(created_at: :desc)
    render 'index'
  end

  def increase_score
    @article = Article.find_by(id: params[:id])
    @article.increase_score

    if @article.save
      render status: 200, json: @article.to_json
    else
      render status: 500, json: @article.to_json
    end
  end

  def decrease_score
    @article = Article.find_by(id: params[:id])
    @article.decrease_score
    if @article.save
      render status: 200, json: @article.to_json
    else
      render status: 500, json: @article.to_json
    end
  end

  def get_title_article
    @article = Article.find_by(id: params[:id])
    render status: 200, json: @article.to_json
  end

  private

  def set_articles
    @user = current_user
    @article = Article.find_by(id: params[:id])
  end

  def articles_params
    params.require(:article).permit(:title, :lead, :body, :price, :photo1,
                                    :photo2, :publish_at, :tag_list)
  end

  def authenticate_writer
    redirect_to '/' unless current_user.is_writer?
  end
end
