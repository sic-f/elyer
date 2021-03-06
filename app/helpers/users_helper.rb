module UsersHelper
  def full_name
    "#{current_user.first_name} #{current_user.last_name}"
  end

  def full_name_for(user)
    "#{user.first_name} #{user.last_name}"
  end

  def has_avatar?(resource, &block)
    capture &block if resource.avatar.attached?
  end

  def user_avatar(avatar)
    avatar.attached? ? avatar.variant(resize: '1024x768') : url_for('no_image.png')
  end

  def user_thumbnail(avatar)
    avatar.attached?  ?
      avatar.variant(resize_to_fill: [64, 64]) :
      url_for('no_image.png')
  end
end
