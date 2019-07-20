module PlacesHelper
  def place_layout_class
    if pages_home?
      'main-view-item -index'
    elsif places_show?
      'main-view-item'
    end
  end

  private

  def pages_home?
    params[:controller] == 'pages' && params[:action] == 'home'
  end

  def places_show?
    params[:controller] == 'places' && params[:action] == 'show'
  end
end
