class Room < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :reservations, dependent: :destroy
end
