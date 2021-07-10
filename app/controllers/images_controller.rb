class ImagesController < ApplicationController
  before_action :set_image, only: %i[show edit]

  def show
    @comments = @image.comments.order(created_at: :asc)
  end

  def edit
    authorize @image, policy_class: ImagePolicy
  end

  def update
    image = Image.find params[:id]

    authorize image, policy_class: ImagePolicy

    if image.update photo_params
      flash[:success] = 'Update successful!'
      redirect_to image_url image
    else
      flash[:danger] = 'Unexpected error.'
      render :edit
    end
  end

  def destroy
    image = Image.find(params[:id])
    place = image.imageable

    authorize image, policy_class: ImagePolicy

    if image.destroy
      flash[:success] = 'Picture deleted successfuly.'
      redirect_to place
    else
      flash[:warning] = 'Something went wrong.'
      render :show
    end
  end

  private

  def set_image
    @image = Image.find params[:id]
  end

  def photo_params
    params.require(:picture).permit(:caption)
  end
end
