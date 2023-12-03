class RoomReservationRelation < ApplicationRecord
  belongs_to :room
  belongs_to :reservation
end
