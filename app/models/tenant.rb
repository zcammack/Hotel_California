class Tenant < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :rooms, through: :reservations
end
