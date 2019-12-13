module PlacesHelper
  def place_layout_class
    if pages_home?
      'main-view-item -index'
    elsif places_show?
      'main-view-item'
    end
  end

  def render_only_on_home_page(&block)
    capture &block if pages_home?
  end

  def place_main_photo(main_photo)
    main_photo.attached? ? main_photo.variant(resize: '400x300') : url_for('no_image.png')
  end

  private

  def pages_home?
    params[:controller] == 'pages' && params[:action] == 'home'
  end

  def places_show?
    params[:controller] == 'places' && params[:action] == 'show'
  end
end
