class Seat < ApplicationRecord
    belongs_to :department
    has_many :reservations
end
