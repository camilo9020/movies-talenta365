# == Schema Information
#
# Table name: reservations
#
#  id                    :bigint(8)        not null, primary key
#  movie_function_id     :bigint(8)
#  name                  :string
#  email                 :string
#  identification_number :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_reservations_on_movie_function_id  (movie_function_id)
#
# Foreign Keys
#
#  fk_rails_...  (movie_function_id => movie_functions.id)
#

FactoryBot.define do
  factory :reservation do
    movie_function { nil }
    name { "MyString" }
    email { "MyString" }
    identification_number { "MyString" }
  end
end
