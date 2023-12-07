class Reservation < ApplicationRecord
  belongs_to :user
  attachment :image
  belongs_to :room
end
