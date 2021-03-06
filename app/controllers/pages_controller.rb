class PagesController < ApplicationController
  def home
    @pagy, @places = pagy(Place.order(created_at: :desc))
  end
end
