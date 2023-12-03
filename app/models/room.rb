class Room < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :reservations, dependent: :destroy
  has_many :room_reservation_relations, dependent: :destroy
end
