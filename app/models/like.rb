class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  after_create :update_post_likes_counter
  after_destroy :update_post_likes_counter

  def update_post_likes_counter=(count)
    post.update_attribute 'likes_counter', count
  end
end
