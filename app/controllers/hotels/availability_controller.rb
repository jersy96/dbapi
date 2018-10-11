class Hotels::AvailabilityController < ApplicationController
  def index
    available_hotels = []
    start_date = params[:start_date]
    final_date = params[:final_date]
    Hotel.all.each do |hotel|
      if hotel.available_room(start_date, final_date)
        available_hotels << hotel
      end
    end
    render json: available_hotels, status: :ok
  end
end
