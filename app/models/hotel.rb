class Hotel < ApplicationRecord
    has_many :rooms, dependent: :destroy
    belongs_to :user

    validates :name, :wifi, :breakfast, :accessibility, presence: true

    validates :name, uniqueness: true

    validates :name, length: { maximum: 64 }

    validates :wifi, inclusion: { in: %w(Yes No),
    message: "%{value} is not a valid option." }

    validates :breakfast, inclusion: { in: %w(Continental American English Other),
    message: "%{value} is not a valid option." }

    validates :accessibility, inclusion: { in: %w(Wheelchair Medical None),
    message: "%{value} is not a valid option." }
end
