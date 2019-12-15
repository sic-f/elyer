class PlacesController < ApplicationController
  before_action :require_login, only: %i[new create edit update destroy]

  def show
    @place = Place.find(params[:id])
  end

  def new
    @user  = User.find(params[:user_id])
    @place = Place.new
  end

  def create
    @user  = current_user
    @place = @user.places.new(place_params)

    if @place.save
      flash[:success] = 'Successfully submitted place!'
      redirect_to @place
    else
      flash[:danger] = 'Unable to submit place.'
      render :new
    end
  end

  def edit
    @place = Place.find(params[:id])

    authorize @place

    render :new
  end

  def update
    @place = Place.find(params[:id])

    authorize @place

    if @place.update(place_params)
      flash[:success] = 'Update success!'

      redirect_to @place
    else
      flash[:danger] = 'Unable to update place.'
      render :new
    end
  end

  def destroy
    place = Place.find(params[:id])

    authorize place

    if place.destroy
      flash[:success] = 'Place deleted successfuly.'
      redirect_to root_url
    else
      flash[:warning] = 'Something went wrong.'
      render :show
    end
  end

  private

    def place_params
      params.require(:place).permit(:name,
                                    :description,
                                    :address,
                                    :mobile,
                                    :landline,
                                    :email,
                                    :main_photo,
                                    images: [])
    end
end
