module ApplicationHelper
  def user_profile_link user
    link_to user.display_name, user_profile_path(user.id)
  end

  def formatted_date date
    l date, format: :short
  end
end
