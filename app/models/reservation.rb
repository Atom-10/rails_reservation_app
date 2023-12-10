class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :guest, numericality: { greater_than_or_equal_to: 1 }
end
