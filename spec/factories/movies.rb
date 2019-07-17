# == Schema Information
#
# Table name: movies
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :string
#  url_imagen  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :movie do
    name { Faker::Movie }
    description { 'Movie description' }
    url_imagen { 'movie_url_image' }
  end
end
