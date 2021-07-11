module ImagesHelper
  def image_authorized_to(operation, resource)
    ImagePolicy.new(current_user, resource).send(operation)
  end

  def picture_edit_caption_label(picture)
    picture.caption? ? 'Edit description' : 'Add description'
  end
end
