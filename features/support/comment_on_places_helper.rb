module CommentsHelper
  def post_comment(content)
    fill_in 'comment[content]', with: content
    click_button 'Post comment'
  end

  def image_has_comment(content)
    post_comment content
  end

  def replace_comment_with(content)
    click_link 'Edit'

    fill_in 'comment[content]', with: content
    click_button 'Post comment'
  end
end

World CommentsHelper
