class PlacesController < ApplicationController
  before_action :require_login, only: %i[new create edit update destroy]

  def show
    @place = Place.includes(:pictures).find(params[:id])
    @presenter = Places::Presenter.new(@place)
  end

  def new
    @user = User.find(params[:user_id])

    authorize @user, policy_class: PlacePolicy

    @place = Place.new
    @profile_picture = @place.build_profile_picture
  end

  def create
    @user = current_user
    @place = @user.places.new(place_params)

    attach_pictures_to_place

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
    @profile_picture = @place.profile_picture || ProfilePicture.new

    authorize @place

    render :new
  end

  def update
    @place = Place.find(params[:id])

    authorize @place

    attach_pictures_to_place

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
                                    :website,
                                    :facebook,
                                    :instagram,
                                    profile_picture_attributes: %i[id image])
    end

    def attach_pictures_to_place
      return if pictures_in_params.blank?

      pictures_in_params.each do |picture|
        @place.pictures.build.image.attach picture
      end
    end

    def pictures_in_params
      params[:place][:pictures]
    end
end
