class PlacesController < ApplicationController
  before_action :require_login, only: %i[new create edit update destroy]

  def show
    @place      = Place.find(params[:id])
    @place_view = Presenters::Place.new
  end

  def new
    @user       = User.find(params[:user_id])
    authorize @user, policy_class: PlacePolicy
    @place      = Place.new
    @main_photo = @place.build_main_photo
  end

  def create
    @user  = current_user
    @place = @user.places.new(place_params)

    attach_photos_to_place

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
                                    :photos,
                                    main_photo_attributes: [:image])
    end

    def attach_photos_to_place
      return if photos_in_params.nil?

      photos_in_params.each do |photo|
        @place.photos.build.photo.attach photo
      end
    end

    def photos_in_params
      params[:place][:photos]
    end
end
