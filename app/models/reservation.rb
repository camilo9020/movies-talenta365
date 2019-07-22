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

class Reservation < ApplicationRecord
  belongs_to :movie_function

  validates_presence_of :name, :email, :identification_number, on: :create, message: "can't be blank"
  validates_uniqueness_of :email, scope: [:movie_function_id], message: "No puede hacer más reservaciones con este mail"
  validate :seats_available?,  on: :create

  def self.by_day(date)
    function_ids = MovieFunction.where(date: date).pluck(:id)
    where(movie_function_id: function_ids)
  end

  private

  def seats_available?
    seats_taken = Reservation.where(movie_function_id: movie_function_id).count
    if seats_taken > 10
      errors.add(:base, 'Ya no hay asientos disponibles para esta función')
    end
  end
end
