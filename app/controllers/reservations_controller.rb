class ReservationsController < ApplicationController
    before_action :set_reservation, only: [:show, :destroy, :edit, :update]
    before_action :set_user

    
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
        if current_user.is_admin?
            @reservation.destroy
            redirect_to reservations_url
        elsif @reservation.user_id == current_user.id
            @reservation.destroy
            redirect_to reservations_url
        end
    end
    
    private
    
    def strong_params
            params.require(:reservation).permit(:user_id, :seat_id)
    end
    
    def set_reservation
            @reservation = Reservation.find(params[:id])
    end

    def set_user
        if not current_user.is_admin?
            user_id = current_user.id
        end
    end
end
