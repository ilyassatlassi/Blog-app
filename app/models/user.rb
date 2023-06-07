class User < ApplicationRecord
    has_one_attached :photo
    has_many :posts, foreign_key: 'author_id'
    has_many :comments, foreign_key: 'author_id'
    has_many :likes, foreign_key: 'author_id'
end
