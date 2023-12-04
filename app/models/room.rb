class Room < ApplicationRecord
  def self.search(search)
    if search
      where(['place LIKE ?', "%#{search}%"])
    else
      all
    end
  end
  belongs_to :user
  attachment :image
  has_many :reservations, dependent: :destroy
  has_many :room_reservation_relations, dependent: :destroy
end
