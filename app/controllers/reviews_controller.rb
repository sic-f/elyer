class ReviewsController < ApplicationController
  before_action :require_login, only: %i[new create edit update destroy]
  before_action :set_place, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    @review          = @place.reviews.build(review_params)
    @review.reviewer = current_user

    if @review.save
      flash[:success] = 'Successfully submitted review.'
      redirect_to @place
    else
      render :new
    end
  end

  private
    def set_place
     @place = Place.find params[:place_id]
    end

    def review_params
      params.require(:review).permit(:headline, :content)
    end
end
