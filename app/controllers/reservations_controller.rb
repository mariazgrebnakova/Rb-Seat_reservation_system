class ReservationsController < ApplicationController
    before_action :set_reservation, only: [:show, :destroy, :edit, :update]
    
    def index
        @reservations = Reservation.all
    end
    
    def new
        @reservation = Reservation.new
    end
    
    def create
        @reservation = Reservation.new(strong_params)
    
        if @reservation.save
               redirect_to reservations_url, flash: { success: 'Reservation saved...'}
        else
                flash[:danger] = 'Reservation not saved...'
                render :new
        end
    end
    
    def update
        if @reservation.update(strong_params)
                redirect_to reservation_url(@reservation), flash: { success: 'Reservation updated...'}
        else
            flash[:danger] = 'Reservation not updated...'
            render :edit
        end
    end
    
    def destroy
        @reservation.destroy
        redirect_to reservations_url
    end
    
    private
    
    def strong_params
            params.require(:reservation).permit(:user_id, :seat_id, :from, :to)
    end
    
    def set_reservation
            @reservation = Reservation.find(params[:id])
    end
end
