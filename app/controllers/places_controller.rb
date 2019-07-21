class PlacesController < ApplicationController

  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)

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

    render :new
  end

  def update
    @place = Place.find(params[:id])

    if @place.update(place_params)
      flash[:success] = 'Update success!'

      redirect_to @place
    else
      flash[:danger] = 'Unable to update place.'
      render :new
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
                                    images: [])
    end
end
