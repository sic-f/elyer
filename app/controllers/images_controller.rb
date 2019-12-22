class ImagesController < ApplicationController
  before_action :get_photo, only: %i[show edit]

  def show
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

  private
  
  def get_photo
    @image = Image.find params[:id]
  end

  def photo_params
    params.require(:photo).permit(:caption)
  end
end
