class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @monsters = Monster.where(user_id: current_user.id)
    @completed_bookings = current_user.bookings.where("end_date < '#{Date.today}'")
    @future_bookings = current_user.bookings.where("start_date >= '#{Date.today}'")
  end


end
