module PostsHelper
  def meta_str post
    "#{l post.created_at, format: :short} by #{user_profile_link post.user}"
  end

  def last_commenter_name_on comment
    comment.user ? user_profile_link(comment.user) : 'anon'
  end

  def last_comment_meta_str comment
    raw "#{l comment.created_at, format: :short} by #{last_commenter_name_on comment}"
  end

  # def comments_meta comments
  #   "Replies: #{comments.count}"
  # end

  def content_preview post    
    preview = truncate(post.content, 
      length: 500, 
      escape: false
      ) { link_to "Continue", post }
    simple_format preview
  end
end
