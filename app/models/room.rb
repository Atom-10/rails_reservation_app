class Room < ApplicationRecord
  def self.search_by_place(place)
    where(['place LIKE ?', "%#{place}%"])
  end

  def self.search_by_name_or_details(search_term)
    where('room_name LIKE ? OR room_details LIKE ?', "%#{search_term}%", "%#{search_term}%")
  end
  belongs_to :user
  attachment :image
  has_many :reservations, dependent: :destroy
  has_many :room_reservation_relations, dependent: :destroy
end
