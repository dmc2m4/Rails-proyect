class Post < ApplicationRecord
  belongs_to :user
  
  validates :image, presence: true,
  validates :body, presence: true,
  
end
