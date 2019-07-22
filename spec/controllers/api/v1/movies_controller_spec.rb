require 'rails_helper'

RSpec.describe Api::V1::MoviesController, type: :controller do
  describe "GET #index" do
    before do
      3.times { create(:movie) }
      get(:index, format: :json)
      @movies = JSON.parse(response.body)["movies"]
    end

    it { expect(response).to have_http_status(200) }
    it "returns all movies" do
      expect(@movies.size).to eq(3)
    end
  end

  describe "POST #create" do
    before do
      post :create, params: { movie: { name: "Movie test", description: "lorem ipsum", url_imagen: "url_imagen_test", function_dates: ["2019-07-21", "2019-07-22", "2017-07-23"]}}
      @movie = JSON.parse(response.body)["movie"]
    end
    it { expect(response).to have_http_status(200) }

    it "create movie correctly" do
      expect(@movie["name"]).to eq("Movie test")
      expect(@movie["description"]).to eq("lorem ipsum")
      expect(@movie["url_imagen"]).to eq("url_imagen_test")
    end

    it "creates all movie functions" do
      expect(MovieFunction.count).to eq(3)
    end
  end
end