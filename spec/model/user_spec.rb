require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'I am a full stack developer') }

  it 'validates presence of name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'validates numericality of posts counter' do
    subject.posts_counter = 'the post counter'
    expect(subject).to_not be_valid
  end

  it 'validates posts counter is greater or equal to zero' do
    subject.posts_counter = -4
    expect(subject).to_not be_valid
  end

  it 'returns the last three posts' do
    user = described_class.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'I am a full stack developer')

    user.posts = [
      Post.new({ title: 'First', text: 'This is my first post' }),
      Post.new({ title: 'Second', text: 'This is my second post' }),
      Post.new({ title: 'Third', text: 'This is my third post' }),
      Post.new({ title: 'Fourth', text: 'This is my fourth post' })
    ]

    expect(user.recent_posts.size).to be(3)
    expect(user.recent_posts.pluck(:id)).to match_array(user.posts.last(3).pluck(:id))
  end
end