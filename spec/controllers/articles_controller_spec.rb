require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  describe "GET /articles" do
    before do
        user = User.create({
              name: "Nombre1",
              email: "nombre@nombre.com",
              password: "12345678",
              password_confirmation: "12345678"
              })
        article = user.articles.create({
              title: 'Título',
              lead: 'Entradilla',
              body: 'Body',
              user_id: User.last.id,
              price: 0.2,
              publish_at: Date.today.to_time - 1
            })
        category = user.articles.last.categories.create({
              name: "Categoría1"
          })
          @user = User.last
          @articles = @user.articles.all
          sign_in @user
    end

    it "returns a list of articles" do
      get :index, user_id: @user.id
      expect(assigns(:articles)).to eq(@articles)
    end

  end


end
