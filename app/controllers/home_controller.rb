class HomeController < ApplicationController
  before_action :set_current_user
  
  def index
    @current_user_reservations = Reservation.all.where(user_id: current_user.id).where('"from" >= ?', Date.current).order(:from).page(params[:page]).per(5)
    searched_date = params[:start_date].present? ? params[:start_date].to_date: Date.current
    @meetings = Reservation.where(user_id: current_user.id).where("\"from\" BETWEEN '#{40.days.before(searched_date)}' AND '#{40.days.after(searched_date)}'")
  end
end
