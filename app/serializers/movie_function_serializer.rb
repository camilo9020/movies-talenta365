class MovieFunctionSerializer < ActiveModel::Serializer
  attributes :movie_name, :date, :id

  def movie_name
    object.movie.name
  end
end
