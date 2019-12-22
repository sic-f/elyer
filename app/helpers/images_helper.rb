module ImagesHelper
  def images_authorized_to(operation, resource)
    ImagePolicy.new(current_user, resource).send(operation)
  end
end
