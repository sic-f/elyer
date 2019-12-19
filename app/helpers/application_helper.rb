module ApplicationHelper
  def has_main_photo?(resource, &block)
    capture &block if resource.main_photo&.image&.attached?
  end

  def authorized_to(operation, resource)
    signed_in? && policy(resource).send(operation)
  end
end
