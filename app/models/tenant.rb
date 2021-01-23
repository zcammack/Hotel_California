class Tenant < ApplicationRecord
    belong_to :user
    has_many :reservations
    has_many :rooms, through: :reservations
end
