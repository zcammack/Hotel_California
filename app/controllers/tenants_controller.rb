class TenantsController < ApplicationController
    has_many :reservations
    has_many :rooms, through: :reservations
end