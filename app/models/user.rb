class User < ApplicationRecord
  # has_one_attached :photo
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  validates :name, presence: true
  validates :postscounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
