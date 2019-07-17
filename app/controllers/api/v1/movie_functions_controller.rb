class Api::V1::MovieFunctionsController < ApplicationController

  def by_date
    movie_functions = MovieFunction.functions_by_day(params[:date])
    if movie_functions.any?
      render json: { movies: movie_functions }, statue: :ok
    else
      render json: { error: 'There is not movie functions for this day' }, status: 400
    end
  end

  def create
    movie_function = MovieFuntion.new(movie_function_params)
    if movie_function.save
      render json: { movie_function: movie_function }, status: :ok
    else
      render json: { error: movie_function.errors }, status: 400
    end
  end

  private

  def movie_function_params
    params.require(:movie).permit(:movie_id, :date)
  end
end
