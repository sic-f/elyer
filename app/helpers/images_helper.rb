module ImagesHelper
  def image_authorized_to(operation, resource)
    ImagePolicy.new(current_user, resource).send(operation)
  end

  def photo_edit_caption_label(photo)
    photo.caption? ? 'Edit description' : 'Add description'
  end
end
