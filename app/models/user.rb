class User < ApplicationRecord
    has_many :tenants
    has_secure_password
end
