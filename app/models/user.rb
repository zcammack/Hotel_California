class User < ApplicationRecord
    has_many :tenants
    has_many :hotels
    has_secure_password
end
