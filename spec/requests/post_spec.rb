require 'rails_helper'

RSpec.describe PostController, type: :request do
  let(:user_id) { 802 }
  let(:post_id) { 3 }

  describe 'GET /index' do
    before { get "/user/#{user_id}/post" }

    it 'returns a success response' do
      expect(response).to be_successful
    end

    it 'renders the index template of views/users' do
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text' do
      result = response.body
      expect(result).to include('Here is a lists of posts for a given user id')
    end
  end

  describe 'GET #show' do
    before { get "/user/#{user_id}/post/#{post_id}" }

    it 'returns a success response' do
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text' do
      result = response.body
      expect(result).to include('Here is a post by id for the given user id')
    end
  end
end