require 'rails_helper'

RSpec.describe "Movies", type: :request do

  describe "GET /movies" do
    before { @movie = Movie.create title: 'Frames from the Edge' }

    it "returns a list of movies" do
      get movies_path(format: :json)
      data = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(data.length).to eq(1)
    end
  end

  describe "GET /movies/:id", type: :request do
    before { @movie = Movie.create title: 'Frames from the Edge' }

    it "returns a proper movie" do
      get movie_path(@movie, format: :json)
      data = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(data['title']).to eq(@movie.title)
    end
  end

  describe "DELETE /movies/:id", type: :request do
    before do
      @movie = Movie.create title: 'Frames from the Edge'
      @count = Movie.count
    end

    it "deletes a movie" do
      delete movie_path(@movie, format: :json)

      expect(response).to have_http_status(204)
      expect(Movie.count).to eq(@count - 1)
    end
  end

  describe "PUT /movies/:id", type: :request do
    before { @movie = Movie.create title: 'Frames from the Edge' }

    it "updates a movie" do
      put movie_path(@movie, format: :json), movie: {title: 'Hair'}

      expect(response).to have_http_status(200)
      expect(@movie.reload.title).to eq('Hair')
    end
  end

  describe "POST /movies", type: :request do
    it "creates a proper movie" do
      post movies_path(format: :json), movie: {title: 'Hair'}

      expect(response).to have_http_status(201)
      expect(Movie.last.title).to eq('Hair')
    end
  end
end