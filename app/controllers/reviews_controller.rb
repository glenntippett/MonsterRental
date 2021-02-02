class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    find_review
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to booking_path(@)
    else
      render :new
    end
  end

  def edit
    find_review
  end

  def update
  end

  private

  def review_params
     params.require(:review).permit(:content, :rating, :booking_id)
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
