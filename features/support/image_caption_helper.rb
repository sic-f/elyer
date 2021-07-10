module ImageCaptionHelper
  def enter_caption_for_picture_with(caption)
    click_link 'Add description'
    fill_in 'picture[caption]', with: caption
    click_button 'Save'
  end
end

World ImageCaptionHelper
