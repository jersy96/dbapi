class HotelsController < ApplicationController
  before_action :set_api_key_user, except: [:index]
  before_action :set_hotel, only: [:update, :destroy]

  def index
    hotels = Hotel.where(index_params)
    render json: hotels, status: :ok
  end

  def create
    hotel = Hotel.new(hotel_params)
    if hotel.save
      render json: hotel, status: :ok
    else
      render json: hotel.errors.messages, status: :unprocessable_entity
    end
  end

  def update
    @hotel.attributes = update_params
    if @hotel.save
      render json: @hotel, status: :ok
    else
      render json: @hotel.errors.messages, status: :unprocessable_entity
    end
  end

  def destroy
    render json: @hotel.destroy, status: :ok
  end

  private
  def set_hotel
    @hotel = Hotel.find(params[:id])
  end

  def hotel_params
    params.permit(
      :name,
      :address,
      :state,
      :fax,
      :hotel_type,
      :number_of_rooms,
      :size,
      :phone,
      :website,
      :email
    )
  end

  def update_params
    params.permit(
      :hotel_type,
      :number_of_rooms,
      :size,
      :phone,
      :website,
      :email
    )
  end

  def index_params
    params.permit(
      :name,
      :state,
      :hotel_type,
      :size
    )
  end
end
