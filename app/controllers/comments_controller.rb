class CommentsController < ApplicationController
  def create
    post = Post.find params[:post_id]
    @comment = post.comments.build params.require(:comment).permit(:body, :user_id)
    @comment.user = current_user if current_user

    if @comment.save
      flash[:notice] = 'Success'
    else
      flash[:alert]  = 'Fail'
    end
    redirect_to post
  end

end
