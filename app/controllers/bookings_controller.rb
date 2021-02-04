class BookingsController < ApplicationController
  def create
    @monster = Monster.find(params[:monster_id])
    @booking = Booking.new(booking_params)
    @booking.monster = @monster
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render new
    end
  end

  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def new
    @booking = Booking.new
  end

  def show
    make_booking
    @monster = @booking.monster
  end

  def update
    make_booking
    @booking.save!
    redirect_to booking_path(@booking)
  end

  def destroy
    make_booking
    @bookig.destroy
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:monster_id, :user_id, :start_date, :end_date, :total_price)
  end

  def make_booking
    @booking = Booking.find(params[:id])
  end
end
