require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'ilyass') }
  let(:post) { Post.create(title: 'Post', text: 'Hello from morooco', author: user) }
  subject { described_class.new(author: user, post:) }

  describe 'post_likes_counter=' do
    it 'updates the post likes counter' do
      expect { subject.post.likes_counter = 1 }.to change { post.likes_counter }.from(0).to(1)
    end
  end
end
