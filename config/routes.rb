Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :articles
    resources :categories
    resources :charges
    resources :transactions

    root to: "users#index"
  end

  devise_for :users, :controllers => {:registrations => "registrations"}

  get '/' => 'site#home'
  get '/articles' => 'articles#index'
  get '/articles/author/:id' => 'articles#author', as: 'author_articles'
  get '/articles/:id' => 'articles#show', as: 'article'
  get '/section/:id' => 'articles#section'
  get '/search/:value' => 'articles#search'
  get '/tags/:tag' => 'articles#index', as: :tag
  get '/increase_likes/:id' => 'articles#increase_score'
  get '/decrease_likes/:id' => 'articles#decrease_score'
  get '/read_after/:id' => 'articles#get_title_article'

  get '/reports/:user_id' => 'charges#reports', as: :reports
  get '/read_by_week/:user_id/:days' => 'charges#articlesBuy'
  get '/write_by_week/:user_id/:days' => 'charges#articlesSold'

  resources :articles do
    resource :charges
  end

  resources :users do
    resources :articles, except: ['index', 'show']
  end

end
