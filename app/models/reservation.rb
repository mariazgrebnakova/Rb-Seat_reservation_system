class Reservation < ApplicationRecord
    belongs_to :seat
    belongs_to :user

    validate :from_must_be_before_to_date
    validate :validate_seat_is_empty

    private

    def from_must_be_before_to_date
        errors.add(:from, "Invalid range") unless
            from <= to
    end

    def seat_is_reserved_dates
        reserved_dates = []
        reserved_place = seat_id
        Reservation.where(seat_id: reserved_place).each do |range|
            (range.from..range.to).each do |date|
                reserved_dates << date
            end      
        end
        return reserved_dates
    end

    def validate_seat_is_empty
        errors.add(:seat_id, "Seat is not available in this date range") unless
            is_seat_empty == true
    end

    def is_seat_empty
        does_not_include = true
        reserved_dates = seat_is_reserved_dates
        (from..to).each do |date|
            if  reserved_dates.nil?
                does_not_include = true
            elsif date.in? reserved_dates
                does_not_include = false
            end
        end
        return does_not_include
    end

end
