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

class Movie < ApplicationRecord
  has_many :movie_functions
end
