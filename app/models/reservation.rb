class Reservation < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :rooms, dependent: :destroy
  has_many :room_reservation_relations, dependent: :destroy
end
