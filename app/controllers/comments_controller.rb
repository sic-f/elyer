class CommentsController < ApplicationController
  before_action :set_comment_and_image, only: %i[edit update destroy]
  before_action :require_login

  def create
      image = Image.find params[:image_id]
    comment = image.comments.build(comment_params)

    if comment.save
      flash[:success] = 'Successfuly added comment.'
      redirect_to image_url image
    else
      flash[:danger] = 'Something went wrong.'
      render 'images/show'
    end
  end

  def edit; end

  def update
    if @comment.update comment_params
      redirect_to image_url @image
    else
      render :edit
    end
  end

  def destroy
    if @comment.destroy
      flash[:warning] = 'Comment deleted.'
      redirect_to image_path(@image)
    else
      flash[:danger] = 'Something went wrong.'
      render 'images/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.to_param)
  end

  def set_comment_and_image
    @comment = Comment.find params[:id]

    authorize @comment

    @image = @comment.commentable
  end
end
