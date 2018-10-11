class HotelSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :state, :fax, :phone, :email, :website, :size, :number_of_rooms, :hotel_type, :longitude, :latitude
end
