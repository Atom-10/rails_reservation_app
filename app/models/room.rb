class Room < ApplicationRecord
  def self.search_by_place(place)
    where(['place LIKE ?', "%#{place}%"])
  end

  def self.search_by_name_or_details(search_term)
    where('room_name LIKE ? OR room_details LIKE ?', "%#{search_term}%", "%#{search_term}%")
  end
  validates :room_name, presence: true
  validates :room_details, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1 }
  validates :place, presence: true
  belongs_to :user
  attachment :image
  has_many :reservations, dependent: :destroy
end
