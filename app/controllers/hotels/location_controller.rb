class Hotels::LocationController < ApplicationController
  def index
    hotels = []
    h = params[:latitude].to_f
    k = params[:longitude].to_f
    rad = params[:range].to_f
    Hotel.all.each do |hotel|
      if hotel.latitude and hotel.longitude
        x = hotel.latitude.to_f
        y = hotel.longitude.to_f
        in_range = ((x-h)**2+(y-k)**2)**0.5 <= rad
        hotels << hotel if in_range
      end
    end
    render json: {hotels: ActiveModel::ArraySerializer.new(hotels, each_serializer: HotelSerializer)}, status: :ok
  end
end
