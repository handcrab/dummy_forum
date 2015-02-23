class CommentsController < ApplicationController
  before_action :set_post
  before_action :check_user, only: :ban
  before_action :verify_captcha, only: :create

  # POST
  def create
    # post = Post.find params[:post_id]
    @comment = @post.comments.build params.require(:comment).permit(:body, :user_id)
    @comment.user = current_user if current_user

    if @comment.save
      flash[:notice] = 'Success'
    else
      flash[:alert]  = 'Fail'
    end
    redirect_to @post
  end

  # PATCH
  def ban  
    comment = @post.comments.find params[:id]
    if comment.update banned: true
      redirect_to @post, notice: 'Success'
    else
      redirect_to @post, alert: 'Fail'
    end
  end

  private
  def set_post
    @post = Post.find params[:post_id]    
  end

  def check_user
    unless current_user == @post.user
      redirect_to @post, alert: 'Only author of the post can ban comments'
    end
  end

  def verify_captcha
    unless current_user
      redirect_to @post, alert: 'go away, bloody robot!' unless verify_recaptcha
    end
  end
end
