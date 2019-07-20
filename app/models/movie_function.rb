# == Schema Information
#
# Table name: movie_functions
#
#  id         :bigint(8)        not null, primary key
#  movie_id   :bigint(8)
#  date       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_movie_functions_on_movie_id  (movie_id)
#
# Foreign Keys
#
#  fk_rails_...  (movie_id => movies.id)
#

class MovieFunction < ApplicationRecord
  belongs_to :movie
  has_many :reservations, dependent: :destroy
  validates_presence_of :date, on: :create, message: "can't be blank"
  scope :functions_by_day, -> (date) { where(date: date.to_date.at_beginning_of_day.utc..date.to_date)}
end
