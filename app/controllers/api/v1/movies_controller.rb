class Api::V1::MoviesController < Api::BaseController
  def index
    movies = Movie.all
    if movies.any?
      render json: { movies: movies }, statue: :ok
    else
      render json: { message: 'There is not movie functions for this day' }, status: 400
    end
  end

  def create
    movie = Movie.new(movie_params)
    if movie.save
      MovieFunction.create_multiple_functions(movie, params[:movie][:function_dates])
      render json: { movie: movie }, status: :ok
    else
      render json: { errors: movie.errors }, status: 400
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :description, :url_imagen)
  end
end
