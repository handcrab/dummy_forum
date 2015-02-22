class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  validates :title, presence: true

  scope :recent, -> { order(created_at: :desc).limit 10 }
end
