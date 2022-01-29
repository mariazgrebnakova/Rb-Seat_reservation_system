class HomeController < ApplicationController
  before_action :set_current_user
  
  def index
    @current_user_reservations = Reservation.all.where(user_id: current_user.id).where('"from" >= ?', Date.current).order(:from).page(params[:page]).per(5)
    searched_month = params[:start_date].present? ? params[:start_date].to_date.month: Date.current.month
    @meetings = Reservation.where(user_id: current_user.id).where("EXTRACT (MONTH FROM \"from\") = #{searched_month}")
  end
end
