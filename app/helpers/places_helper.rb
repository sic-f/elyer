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

  def profile_picture(profile_picture)
    profile_picture&.image&.attached? ? profile_picture.image.variant(resize_to_limit: [1024, 768]) : url_for('no_image.png')
  end

  def profile_picture_original_size(profile_picture)
    profile_picture&.image&.attached? ? profile_picture.image : url_for('no_image.png')
  end

  private

  def pages_home?
    controller_path == 'pages' && action_name == 'home'
  end

  def places_show?
    controller_path == 'places' && action_name == 'show'
  end
end
