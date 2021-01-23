class Tenant < ApplicationRecord
    has_many :rooms
    has_many :hotels through :rooms
end
