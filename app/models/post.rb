class Post < ApplicationRecord
    has_many :likes
    has_many :comments
    belongs_to :user, class_name: 'User', foreign_key: 'author_id'
end
