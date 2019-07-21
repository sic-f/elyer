module AttachmentsHelper
  # For System Tests
  def image_upload_file(image_path = 'public/apple-touch-icon.png')
    Rails.root.join image_path
  end

  # For attachments not coming from a web request (local files or downloaded files only)
  def local_file(image_path = 'public/apple-touch-icon.png')
    { io: File.open(Rails.root.join(image_path)), filename: 'test_image.jpg' }
  end
end
