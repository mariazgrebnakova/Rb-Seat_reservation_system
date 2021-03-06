class SeatsController < ApplicationController
    before_action :set_seat, only: [:show, :destroy, :edit, :update]
    
    def index
        @q = Seat.ransack(params[:q])
        @seats = @q.result.includes(:department).page(params[:page])
    end
    
    def new
        @seat = Seat.new
    end
    
    def create
        @seat = Seat.new(strong_params)
    
        if @seat.save
               redirect_to seats_url, flash: { success: t('seats.alerts.seat_saved')}
        else
                flash[:danger] = t('seats.alerts.seat_not_saved')
                render :new
        end
    end
    
    def update
        if @seat.update(strong_params)
                redirect_to seat_url(@seat), flash: { success: t('seats.alerts.seat_updated')}
        else
            flash[:danger] = t('seats.alerts.seat_not_updated')
            render :edit
        end
    end
    
    def destroy
        @seat.destroy
        redirect_to seats_url
    end
    
    private
    
    def strong_params
            params.require(:seat).permit(:name, :department_id, :coordinates, :shape)
    end
    
    def set_seat
            @seat = Seat.find(params[:id])
    end
end
