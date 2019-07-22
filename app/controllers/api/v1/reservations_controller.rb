class Api::V1::ReservationsController < Api::BaseController

  def index
    reservations = Reservation.by_day(params[:date])
    render json: reservations, statue: :ok
  end

  def create
    reservation = Reservation.new(reservation_params)
    if reservation.save
      render json: { message: 'The reservation was create' }, status: :ok
    else
      render json: { errors: reservation.errors }, status: 400
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:name, :email, :identification_number, :movie_function_id)
  end
end
