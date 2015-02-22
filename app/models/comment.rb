class Comment < ActiveRecord::Base
  belongs_to :post  
  belongs_to :user

  validates :body, presence: true
  
  scope :active, -> { where banned: false }
  scope :recent, -> { order(created_at: :desc).limit 10 }
end
