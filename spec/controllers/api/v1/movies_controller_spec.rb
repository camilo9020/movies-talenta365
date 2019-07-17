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

  # describe "GET #create" do
  #   it "returns http success" do
  #     get :create
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end