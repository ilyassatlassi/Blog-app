FactoryBot.define do
    factory :user do
      name { 'John Doe' }
      bio { 'This is my bio' }
      posts_counter { 0 }
    end
  end