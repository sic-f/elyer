module CommentsHelper
  def post_comment content
    fill_in 'comment[content]', with: content
    click_button 'Post comment'
  end
end

World CommentsHelper
