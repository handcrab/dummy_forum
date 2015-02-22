module PostsHelper
  def meta_str post
    "#{formatted_date post.created_at} by #{user_profile_link post.user}"
  end

  def last_commenter_name_on comment
    comment.user ? user_profile_link(comment.user) : 'anon'
  end

  def last_comment_meta_str comment
    raw "#{formatted_date comment.created_at} by #{last_commenter_name_on comment}"
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
