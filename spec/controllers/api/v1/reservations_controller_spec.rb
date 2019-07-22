require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :controller do
  let(:movie) { FactoryBot.create(:movie) }
  let(:movie_function) { FactoryBot.create(:movie_function, movie: movie, date: '2019-07-22') }
  describe "GET #index" do
    let!(:reservation1) { FactoryBot.create(:reservation, movie_function: movie_function, name: 'JC', email: "jc@example.com", identification_number: '1234567')}
    let!(:reservation2) { FactoryBot.create(:reservation, movie_function: movie_function, name: 'JC 2', email: "jc2@example.com", identification_number: '12345678')}

    before do
      get(:index, format: :json, params: { date: '2019-07-22'})
      @reservations = JSON.parse(response.body)["reservations"]
    end

    it { expect(response).to have_http_status(200) }
    it "returns all reservations" do
      expect(@reservations.size).to eq(2)
    end
  end

  describe "POST #create" do
    before do
      post(:create, format: :json, params: { reservation: { name: "jc", email: "jc@example.com", identification_number: "123456789", movie_function_id: movie_function.id }})
      @message = JSON.parse(response.body)["message"]
    end

    it { expect(response).to have_http_status(200) }
    it { expect(@message).to eq('The reservation was create') }
  end
end
