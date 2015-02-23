module UsersHelper
  def last_seen_tag date, tag=:div ,attributes={}, &block
    if date
      formatted_date = l date, format: :short
      msg = "last seen: #{formatted_date}"
      content_tag tag, msg, attributes, &block
    end
  end

  def avatar_tag user, attributes={size: '25x25', class: 'avatar'}
    avatar_url = if user
      user.avatar || gravatar_url(user.email)
    else
      gravatar_url 'anon'
    end
    image_tag avatar_url, attributes
  end

  def gravatar_url email
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png"
    # image_tag 'http://placehold.it/260x180'
  end

  def activity_link activity
    activity_path = if activity.is_a? Post
      activity
    else
      "#{post_path activity.post}\##{activity.id}"
    end
    link_to activity.class.to_s, activity_path
  end
end
