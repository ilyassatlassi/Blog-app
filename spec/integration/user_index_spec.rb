require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  let!(:user1) { User.create(name: 'Ilyass', bio: 'Developer', photo: 'www.unsplash.com/user/1', posts_counter: 4) }
  let!(:user2) { User.create(name: 'Atlassi', bio: 'Pentester', photo: 'www.unsplash.com/user/2', posts_counter: 10) }

  before do
    visit users_path
  end

  describe 'Page content' do
    it 'Display all usernames' do
      expect(page).to have_content(user1.name)
      expect(page).to have_content(user2.name)
    end
    it 'Display number of posts for each user' do
      expect(page).to have_content("Number of posts #{user1.posts_counter}")
      expect(page).to have_content("Number of posts #{user2.posts_counter}")
    end
    it 'Display profile picture for each user' do
      expect(page).to have_selector("img[src='#{user1.photo}']")
      expect(page).to have_selector("img[src='#{user2.photo}']")
    end
  end

  describe 'Check each user' do
    it "Redirect to user1's show page" do
      click_link user1.name
      expect(current_path).to eq user_path(user1)
    end
    it "Redirect to user2's show page" do
      click_link user2.name
      expect(current_path).to eq user_path(user2)
    end
  end
end
