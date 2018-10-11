class ReservationsController < ApplicationController
  def create
    reservation = Reservation.new(reservation_params)
    if reservation.save
      render json: reservation, status: :ok
    else
      render json: reservation.errors.messages, status: :unprocessable_entity
    end 
  end

  private
  def reservation_params
    params.permit(
      :user_id,
      :hotel_id,
      :start_date,
      :final_date
    )
  end
end
