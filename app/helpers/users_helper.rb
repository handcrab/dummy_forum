module UsersHelper
  def last_seen_div date, attributes={}, &block
    if date
      formatted_date = l date, format: :short
      msg = "last seen: #{formatted_date}"
      content_tag :div, msg, attributes, &block
    end
  end

  def avatar_tag user, attributes={}
    image_tag user.avatar || gravatar_url(user), attributes
  end

  def gravatar_url user
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png"
    # image_tag 'http://placehold.it/260x180'
  end
end
