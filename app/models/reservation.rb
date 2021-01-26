class Reservation < ApplicationRecord

  belongs_to :room
  belongs_to :tenant
  accepts_nested_attributes_for :tenant
end
