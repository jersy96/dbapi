class HotelsController < ApplicationController
  before_action :set_api_key_user
  before_action :set_hotel, only: [:update, :destroy]

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
      :size,
      :phone,
      :website,
      :email
    )
  end

  def update_params
    params.permit(
      :hotel_type,
      :size,
      :phone,
      :website,
      :email
    )
  end
end
