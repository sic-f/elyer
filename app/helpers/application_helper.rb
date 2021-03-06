module ApplicationHelper
  include Pagy::Frontend

  def has_main_photo?(resource, &block)
    capture &block if resource.main_photo&.image&.attached?
  end

  def authorized_to?(operation, resource)
    signed_in? && policy(resource).send(operation)
  end

  def authorized_to_perform_operations_on?(resource)
    signed_in? && can_perorm_all_operations_on?(resource)
  end

  private
    OPERATIONS = [:edit?, :destroy?]
    def can_perorm_all_operations_on?(resource)
      OPERATIONS.all? { |operation| policy(resource).send operation }
    end
end
