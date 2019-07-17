class Api::V1::MoviesController < ApplicationController
  protect_from_forgery except: :create

  def index
    movies = Movie.all
    if movies.any?
      render json: { movies: movies }, statue: :ok
    else
      render json: { error: 'There is not movie functions for this day' }, status: 400
    end
  end

  def create
    movie = Movie.new(movie_params)
    if movie.save
      render json: { movie: movie }, status: :ok
    else
      render json: { error: movie.errors }, status: 400
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :description, :url_imagen)
  end
end
