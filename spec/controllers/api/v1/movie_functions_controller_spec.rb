require 'rails_helper'

RSpec.describe Api::V1::MovieFunctionsController, type: :controller do
  describe "GET #index" do
    let(:movie) { FactoryBot.create(:movie) }
    before do
      3.times { create(:movie_function, movie: movie, date: "2019-07-20") }
      2.times { create(:movie_function, movie: movie, date: "2019-07-21") }
      1.times { create(:movie_function, movie: movie, date: "2019-07-22") }
    end

    it "returns all functions for 2019-07-20" do
      get(:by_date, format: :json, params: { date: "2019-07-20"})
      movie_functions = JSON.parse(response.body)["movie_functions"]
      expect(response).to have_http_status(200)
      expect(movie_functions.size).to eq(3)
    end

    it "returns all functions for 2019-07-21" do
      get(:by_date, format: :json, params: { date: "2019-07-21"})
      movie_functions = JSON.parse(response.body)["movie_functions"]
      expect(response).to have_http_status(200)
      expect(movie_functions.size).to eq(2)
    end

    it "returns all functions for 2019-07-22" do
      get(:by_date, format: :json, params: { date: "2019-07-22"})
      movie_functions = JSON.parse(response.body)["movie_functions"]
      expect(response).to have_http_status(200)
      expect(movie_functions.size).to eq(1)
    end
  end


end
