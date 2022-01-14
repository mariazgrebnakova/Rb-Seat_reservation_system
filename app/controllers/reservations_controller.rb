class ReservationsController < ApplicationController
    before_action :set_reservation, only: [:show, :destroy, :edit, :update]
    before_action :set_user


    def index
        @reservations = Reservation.all.page(params[:page])
    end
    
    def new
        params[:date] ||= Date.today

        @reservation = Reservation.new(seat_id: params[:seat_id], from: params[:date], to: params[:date])
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

    # Show map
    def map
        prepare_map
    end

    # After form is submitted from map: either searching for date or creating reservation
    def submit_from_map
        if params[:type] == 'reserve'
            @reservation = Reservation.new(
              seat_id: params[:seat_id],
              from: params[:from],
              to: params[:to],
              user_id: current_user.id
            )

            return redirect_to map_reservations_url, flash: { success: 'Successfully reserved' } if @reservation.save
        end

        prepare_map

        render :map
    end
    
    private
    
    def strong_params
            params.require(:reservation).permit(:user_id, :seat_id, :from, :to)
    end
    
    def set_reservation
            @reservation = Reservation.find(params[:id])
    end

    def set_user
        if not current_user.is_admin?
            user_id = current_user.id
        end
    end

    def prepare_map
        params[:from] ||= Date.today
        params[:to] ||= Date.today

        @seats = Seat.all # where(department_id: params[:department])
        @reservations_by_seat = Reservation
                                 .for_range(params[:from], params[:to])
                                 .group_by(&:seat_id)
    end
end
