class Api::V1::MovieFunctionsController < Api::BaseController

  def by_date
    movie_functions = MovieFunction.functions_by_day(params[:date])
    render json: movie_functions, statue: :ok
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
