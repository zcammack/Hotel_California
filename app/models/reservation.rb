class Reservation < ApplicationRecord
    belongs_to :tenant
    belongs_to :room
end
