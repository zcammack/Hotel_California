class Room < ApplicationRecord
  belongs_to :hotel
  has_many :reservations, dependent: :destroy
  has_many :tenants, through: :reservations

  validates :room_number, :smoking, presence: true

  validates :room_number, numericality: { only_integer: true }

  validates :smoking, inclusion: { in: %w(Yes No),
  message: "%{value} is not a valid option." }

  def room_name
    "#{Hotel.find(hotel.id).name} - Room Number: #{room_number}"
  end
end
