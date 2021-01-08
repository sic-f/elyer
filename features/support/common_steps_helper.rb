module CommonSteps
  def visit_home_page
    visit '/'
  end

  def visit_sign_up_page
    visit '/signup'
  end

  def visit_login_page
    visit '/login'
  end

  def login
    user = create :user
    visit root_path as: user
  end

  def log_in(name)
    @user = create_user_from name
    sign_in_as @user
  end

  def signed_in_on_homepage(name)
    log_in name
    visit_home_page
  end

  def log_in_and_create_place(name:, place:)
    @user  = create_user_from name
    @place = create_place_with_user_from place: place, user: @user
    @photo = create :photo, place: @place

    attach_image

    sign_in_as @user
  end

  def create_place_with_photo_from(place)
    @place = create :place
    @photo = create :photo, place: @place

    attach_image
  end

  private

  def create_user_from(name)
    first_name = name.split.first
    last_name  = name.split.last

    create :user, first_name: first_name, last_name: last_name
  end

  def create_place_with_user_from(place:, user:)
    create :place, name: place, user: user
  end

  def attach_image
    @place.photos.first.photo.attach local_file
    @place.save
  end
end

World CommonSteps
