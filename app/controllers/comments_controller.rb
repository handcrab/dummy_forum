class CommentsController < ApplicationController
  def create
    post = Post.find params[:post_id]
    @comment = post.comments.build params.require(:comment).permit(:body, :user_id)
    @comment.user = current_user if current_user

    flash[:notice] = if @comment.save
      'Success'
    else
      'Fail'
    end
    redirect_to post
  end

end
