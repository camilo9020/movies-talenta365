class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :movie_name, :name, :email, :identification_number

  def movie_name
    object.movie_function.movie.name
  end
end
