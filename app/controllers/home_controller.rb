class HomeController < ApplicationController
  before_action :set_current_user
  
  def index
    @current_user_reservations = Reservation.all.where(user_id: current_user.id).where('"from" >= ?', Date.current).order(:from).page(params[:page]).per(5)
    @meetings = Reservation.where(user_id: current_user.id)
  end
end
