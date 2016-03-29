require 'rails_helper'

RSpec.describe "Articles", type: :routing do

  before(:each) do
      user = User.create({
            name: "Nombre1",
            email: "nombre@nombre.com",
            password: "12345678",
            password_confirmation: "12345678"
            })
      @article = Article.create({
            title: 'Title',
            lead: 'Lead',
            body: 'Body'
          })
          @user = User.last
  end


  it 'routes /articles to the articles controller' do
    expect(get(articles_path)).to route_to(:controller => 'articles', :action => 'index')
  end

  it 'routes /articles/new to the articles controller' do
    expect(get(new_user_article_path(@user.id))).to route_to(:controller => 'articles', :action => 'new', :user_id => @user.id.to_s)
  end

  it 'routes /articles to the articles controller' do
    expect(post(articles_path)).to route_to(:controller => 'articles', :action => 'create')
  end

  it 'routes /articles/:id/edit to the articles controller' do
    expect(get(edit_article_path(@article))).to route_to(:controller => 'articles', :action => 'edit', :id => "#{@article.id}")
  end

  it 'routes /articles/:id to the articles controller' do
    expect(patch(article_path(@article))).to route_to(:controller => 'articles', :action => 'update', :id => "#{@article.id}")
  end

  it 'routes /articles/:id to the articles controller' do
    expect(put(article_path(@article))).to route_to(:controller => 'articles', :action => 'update', :id => "#{@article.id}")
  end

  it 'routes /articles/:id to the articles controller' do
    expect(delete(article_path(@article))).to route_to(:controller => 'articles', :action => 'destroy', :id => "#{@article.id}")
  end

end
