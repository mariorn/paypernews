class ArticlesController < ApplicationController
  before_action :set_articles, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @articles = Article.all.order(created_at: :desc)
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
    
    binding.pry

    @category = Category.find_by(name: params['category'])

    @article.categories << @category

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

  private

    def set_articles
      @user = current_user
      @article = Article.find_by(id: params[:id])
    end

    def articles_params
      params.require(:article).permit(:title, :lead, :body, :price, :photo1, :photo2)
    end

end
