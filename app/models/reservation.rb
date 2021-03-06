class Reservation < ApplicationRecord
    belongs_to :seat
    belongs_to :user

    validate :from_must_be_before_to_date
    validate :validate_seat_is_empty
    validate :validates_user_has_no_reservation

    validates :seat_id, presence: true
    validates :from, presence: true
    validates :to, presence: true

    scope :for_range, ->(from, to) { where('"from" <= ? AND "to" >= ?', to, from) }

    private

    def from_must_be_before_to_date     
        errors.add(:from, "Invalid range") if from && to && from > to
    end

    def seat_is_reserved_dates
        reserved_dates = []
        reserved_place = seat_id

        Reservation.where(seat_id: reserved_place).each do |range|
            (range.from..range.to).each do |date|
                reserved_dates << date
            end      
        end

        reserved_dates
    end

    def validate_seat_is_empty
        errors.add(:seat_id, "Seat is taken") unless is_seat_empty
    end

    def is_seat_empty
        return false unless from && to

        reserved_dates = seat_is_reserved_dates

        (from..to).each do |date|
            return false if date.in? reserved_dates
        end

        true
    end

    def user_reservations_dates
        user_reservations_dates = []
        choosed_user = user_id
        Reservation.where(user_id: choosed_user).each do |range|
            (range.from..range.to).each do |date|
                user_reservations_dates << date
            end 
        end
        return user_reservations_dates
    end

    def user_has_no_reservation
        return false unless from && to
 #       has_no_reservation = true

        reservation_dates = user_reservations_dates

        (from..to).each do |date|
            return false if date.in? reservation_dates
        end

        true
    end

    def validates_user_has_no_reservation
        errors.add(:user_id, "More than one reservation by user on this date") unless
            user_has_no_reservation == true
    end
end
