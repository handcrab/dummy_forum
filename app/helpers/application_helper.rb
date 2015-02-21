module ApplicationHelper
  def user_profile_link user
    link_to user.display_name, user_profile_path(user.id)
  end
end
