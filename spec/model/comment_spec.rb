require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'ilyass') }
  let(:post) { Post.create(title: 'Hello, world!', text: 'This is my first post.') }
  subject { described_class.new(author: user, post:, text: 'Good post!') }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without an author' do
      subject.author = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a post' do
      subject.post = nil
      expect(subject).to_not be_valid
    end
  end
end
