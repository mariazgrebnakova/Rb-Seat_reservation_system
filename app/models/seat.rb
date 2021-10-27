class Seat < ApplicationRecord
    validates :name, presence: true
end