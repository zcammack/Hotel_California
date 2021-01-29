class Tenant < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :rooms, through: :reservations

  validates :first_name, :last_name, :age, presence: true

  validates :first_name, length: { maximum: 32 }

  validates :last_name, length: { maximum: 32 }

  validates :age, numericality: { only_integer: true }

  scope :senior, -> { where("age > 65") }

  scope :underage, -> { where("age < 18") }
end
