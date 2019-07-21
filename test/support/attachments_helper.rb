module AttachmentsHelper
  def image_upload_file(image_path='public/apple-touch-icon.png')
    Rails.root.join image_path
  end
end
