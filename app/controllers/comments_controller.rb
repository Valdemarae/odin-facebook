class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if (@comment.save)
      redirect_to posts_path
    else
      render posts_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:creator_id, :content)
  end
end
