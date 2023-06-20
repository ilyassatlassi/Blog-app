require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  include Rails.application.routes.url_helpers

  let!(:user) { User.create(name: 'Ilyass', bio: 'Developer', photo: 'www.unsplash.com/user/1') }
  let!(:post1) { Post.create(title: 'Post1', text: 'This is my 1st post', author: user) }
  let!(:post2) { Post.create(title: 'Post2', text: 'This is my 2nd post', author: user) }
  let!(:post3) { Post.create(title: 'Post3', text: 'This is my 3rd post', author: user) }
  let!(:post4) { Post.create(title: 'Post4', text: 'This is my 4th post', author: user) }

  before do
    visit user_path(user)
  end

  describe 'Content page' do
    it "displays user's name" do
      expect(page).to have_content(user.name)
    end

    it 'displays number of posts' do
      expect(page).to have_content("Number of posts #{user.posts_counter}")
    end

    it "displays user's bio" do
      expect(page).to have_content(user.bio)
    end

    it "displays user's profile picture" do
      expect(page).to have_css("img[src='#{user.photo}']")
    end

    it "displays user's recent 3 posts" do
      expect(page).to have_content(post2.title)
      expect(page).to have_content(post3.title)
      expect(page).to have_content(post4.title)
    end

    it 'displays a button to view all posts' do
      expect(page).to have_link('See All Posts', href: user_posts_path(user))
    end
  end

  describe 'Click to see a post' do
    it 'should redirect to show page for correct post' do
      click_link post3.title
      expect(current_path).to eq user_post_path(user, post3)
    end
  end

  describe 'Click to see all posts' do
    it "redirects to user's post's index page" do
      click_link 'See All Posts'
      expect(current_path).to eq user_posts_path(user)
    end
  end
end
