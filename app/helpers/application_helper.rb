module ApplicationHelper
  def has_main_photo?(resource, &block)
    capture &block if resource.main_photo.attached?
  end
end
