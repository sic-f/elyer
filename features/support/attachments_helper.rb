module AttachmentsHelper
  # For Feature Tests
  def image_upload_file(image_path = 'test/support/apple.jpg')
    Rails.root.join image_path
  end

  def another_image_upload_file(image_path = 'test/support/smile.jpg')
    Rails.root.join image_path
  end

  # For attachments not coming from a web request (local files or downloaded files only)
  def local_file(image_path = 'test/support/apple.jpg')
    { io: File.open(Rails.root.join(image_path)), filename: 'test_image.jpg' }
  end
end
