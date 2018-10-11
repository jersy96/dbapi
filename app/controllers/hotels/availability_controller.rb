class Hotels::AvailabilityController < ApplicationController
  def index
    available_hotels = []
    start_date = params[:start_date]
    final_date = params[:final_date]
    Hotel.where(state: params.require('state')).each do |hotel|
      if hotel.available_room(start_date, final_date)
        available_hotels << hotel
      end
    end
    render json: {hotels: ActiveModel::ArraySerializer.new(available_hotels, each_serializer: HotelSerializer)}, status: :ok
  end
end
