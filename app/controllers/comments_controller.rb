class CommentsController < ApplicationController
  def create
    @post = Post.find params[:post_id]
    @comment = @post.comments.build params.require(:comment).permit(:body)
    
    flash[:notice] = if @comment.save
      'Success'
    else
      'Fail'
    end
    redirect_to @post
  end

end
