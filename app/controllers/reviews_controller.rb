class ReviewsController < ApplicationController
  before_action :find_booking, only: [:new, :create]
  def index
    @reviews = Review.all
  end

  # def show
  #   find_review
  # end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    if @review.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  # def edit
  #   find_review
  # end

  # def update
  # end
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to dashboard_path
  end

  private

  def find_monster
    @monster = Monster.find(params[:monster_id])
  end

  def review_params
     params.require(:review).permit(:content, :rating, :booking_id)
  end

  def find_booking
    @booking = Booking.find(params[:booking_id])
  end
end
