class ReviewsController < ApplicationController
  before_action :require_login, only: %i[new create edit update destroy]
  before_action :set_review, only: %i[edit update]
  before_action :set_place, only: %i[new create edit update destroy]

  def new
    @review = Review.new
  end

  def create
    @review = @place.reviews.build(review_params)
    @review.reviewer = current_user

    if @review.save
      flash[:success] = 'Successfully submitted review.'
      redirect_to @place
    else
      render :new
    end
  end

  # TODO: Add test
  def edit
  end

  # TODO: Add test
  def update
    authorize @review

    if @review.update(review_params)
      flash[:success] = 'Review updated.'
      redirect_to @place
    else
      render :edit
    end
  end

  # TODO: Add test
  def destroy
    review = Review.find params[:id]

    authorize review

    if review.destroy
      flash[:warning] = 'Review deleted.'
      redirect_to @place
    else
      flash[:danger] = 'Unable to delete review.'
      redirect_to @place
    end
  end

  private
   def set_review
      @review = Review.find params[:id]
    end

    def set_place
     @place = Place.find params[:place_id]
    end

    def review_params
      params.require(:review).permit(:headline, :content)
    end
end
