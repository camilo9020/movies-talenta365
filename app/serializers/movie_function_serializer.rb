class MovieFunctionSerializer < ActiveModel::Serializer
  attributes :name, :function_date, :id, :url_imagen

  def name
    object.movie.name
  end

  def function_date
    object.date.to_date
  end

  def url_imagen
    object.movie.url_imagen
  end
end
