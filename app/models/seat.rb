class Seat < ApplicationRecord
    belongs_to :department
    has_many :reservations

    def seat_color
        if id == 2
            return "{fillColor:'FFFF00'}"
        else
            return "{fillColor:'800080'}"
        end
    end

end
