class Hotel < ApplicationRecord
    has_many :rooms, dependent: :destroy
    belongs_to :user
end
