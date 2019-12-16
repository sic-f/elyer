class PagesController < ApplicationController
  def home
    @places = Place.all.order(updated_at: :desc)
  end
end
