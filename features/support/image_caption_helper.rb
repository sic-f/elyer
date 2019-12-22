module ImageCaptionHelper
  def enter_caption_for_photo_with(caption)
    click_link 'Edit'
    fill_in 'photo[caption]', with: caption
    click_button 'Save'
  end
end

World ImageCaptionHelper
