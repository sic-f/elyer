class CommentsController < ApplicationController
  def create
    image   = Image.find params[:image_id]
    comment = image.comments.build(comment_params)

    if comment.save
      flash[:success] = 'Successfuly added comment.'
      redirect_to image_url image
    else
      flash[:danger] = 'Something went wrong.'
      render 'images/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.to_param)
  end
end
