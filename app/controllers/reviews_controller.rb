class ReviewsController < ApplicationController
  before_action :find_booking, only: [:new, :create ]
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
    @review.user = current_user
    @review.booking = @booking
    if @review.save
      redirect_to reviews_path
    else
      render :new
    end
  end

  # def edit
  #   find_review
  # end

  # def update
  # end

  private

  def review_params
     params.require(:review).permit(:content, :rating, :booking_id)
  end

  def find_booking
    @booking = Booking.find(params[:booking_id])
  end
end
