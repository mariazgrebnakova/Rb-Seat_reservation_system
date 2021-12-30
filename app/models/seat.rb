class Seat < ApplicationRecord
    belongs_to :department
    has_many :reservations

    def seat_color
        if is_seat_empty == true
            return "{fillColor:'3CB371'}"
        else
            return "{fillColor:'FA8072'}"
        end
    end

    private

    def is_seat_empty
        from_date = Date.today
        to_date = Date.today
        is_empty = true
        (from_date..to_date).each do |date|
            if reserved_dates.nil?
                is_empty = true
            elsif date.in? reserved_dates
                is_empty = false
            else
                is_empty = true
            end
        end
        return is_empty   
    end

    def reserved_dates
        seat_id_param = id
        reserved_dates = []
        seat = Seat.includes(:reservations).where(id: seat_id_param)
        seat[0].reservations.each do |x|
            (x.from..x.to).each do |date|
                reserved_dates << date
            end
        end
        reserved_dates.uniq!
        return reserved_dates
    end
end
