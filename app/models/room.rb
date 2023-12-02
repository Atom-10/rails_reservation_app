class Room < ApplicationRecord
  belongs_to :user
  attachment :image
  belongs_to :reservation
end
