class Post < ApplicationRecord
    has_many :like
    has_many :comments
    belongs_to :user, class_name: 'User', foreign_key: 'author_id'
end
