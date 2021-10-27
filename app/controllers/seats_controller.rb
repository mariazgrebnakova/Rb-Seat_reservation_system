class SeatsController < ApplicationController
    before_action :set_seat, only: [:show, :destroy, :edit, :update]
    
    def index
        @seats = Seat.all
    end
    
    def new
        @seat = Seat.new
    end
    
    def create
        @seat = Seat.new(strong_params)
    
        if @seat.save
               redirect_to seats_url, flash: { success: 'Seat saved...'}
        else
                flash[:danger] = 'Seat not saved...'
                render :new
        end
    end
    
    def update
        if @seat.update(strong_params)
                redirect_to seat_url(@seat), flash: { success: 'Seat updated...'}
        else
            flash[:danger] = 'Seat not updated...'
            render :edit
        end
    end
    
    def destroy
        @seat.destroy
        redirect_to seats_url
    end
    
    private
    
    def strong_params
            params.require(:seat).permit(:name)
    end
    
    def set_seat
            @seat = Seat.find(params[:id])
    end
end
