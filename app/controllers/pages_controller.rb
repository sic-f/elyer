class PagesController < ApplicationController
  def home
    @places = Place.order(created_at: :desc).page params[:page]
  end
end
