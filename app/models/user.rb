class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments

  def display_name
    return get_name_from_mail if name.blank?
    name
  end
  
  def recent_activity
    # TODO ??? comments.recent.to_a
    activities = []
    activities.push comments.recent.to_a, posts.recent.to_a
    activities.flatten.sort_by { |activity| activity.created_at }.reverse
  end
  
  private
  def get_name_from_mail
    email.match(/(.*?)@.*/)[1]
  end
end
