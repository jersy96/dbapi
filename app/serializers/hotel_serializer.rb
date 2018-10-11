class HotelSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :state, :fax, :phone, :email, :website, :size, :hotel_type, :longitude, :latitude
end
