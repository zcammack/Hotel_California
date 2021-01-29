class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :tenant

  validates :party_size, :start_date, :end_date, presence: true

  validates :party_size, numericality: { only_integer: true }

  def reservation_tenant
    "#{Tenant.find(tenant.id).first_name} #{Tenant.find(tenant.id).last_name}"
  end
end
