require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  let!(:user) { User.create(name: 'Ilyass', bio: 'Developer', photo: 'www.unsplash.com/user/1') }
  let!(:post) { Post.create(title: 'Post1', text: 'First post', author: user) }
  let!(:comment) { Comment.create(author: user, post:, text: 'First comment') }
  let!(:likes) { Like.create(author: user, post:) }

  before do
    visit user_post_path(user, post)
  end

  describe 'Page content' do
    it "Display post's title" do
      expect(page).to have_content(post.title)
    end

    it "Display user's name" do
      expect(page).to have_content(user.name)
    end

    it 'Display post body' do
      expect(page).to have_content(post.text)
    end

    it 'Display the comment s username ' do
      expect(page).to have_content(comment.author.name)
    end

    it 'Display the comments' do
      expect(page).to have_content(comment.text)
    end

    it 'Display comment counts for each post' do
      expect(page).to have_content("Comments: #{post.comments_counter}")
    end
    
    it 'Display total likes for a post' do
      expect(page).to have_content("Likes: #{post.likes_counter}")
    end

    it 'should have a button for Add Comment' do
        expect(page).to have_button('Add Comment')
    end

    it 'should have a button for Give Like' do
        expect(page).to have_button('Give Like')
      end
  end
end
