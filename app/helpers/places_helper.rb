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
    main_photo&.image&.attached? ? main_photo.image.variant(resize: '400x300') : url_for('no_image.png')
  end

  private

  def pages_home?
    controller_path == 'pages' && action_name == 'home'
  end

  def places_show?
    controller_path == 'places' && action_name == 'show'
  end
end
