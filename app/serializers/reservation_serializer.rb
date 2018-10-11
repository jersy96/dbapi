class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :room_id, :user_id, :start_date, :final_date, :hotel_id
end
