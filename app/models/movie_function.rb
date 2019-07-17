# == Schema Information
#
# Table name: movie_functions
#
#  id         :bigint           not null, primary key
#  movie_id   :bigint
#  date       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MovieFunction < ApplicationRecord
  belongs_to :movie
end
