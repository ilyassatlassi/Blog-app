require 'rails_helper'

RSpec.describe UserController, type: :request do
  let(:user_id) { 802 }

  describe 'GET /index' do
    before { get '/user/' }

    it 'returns a success response' do
      expect(response).to be_successful
    end

    it 'renders the index template of views/users' do
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text' do
      result = response.body
      expect(result).to include('Here is a lists of user')
    end
  end

  describe 'GET #show' do
    before { get "/user/#{user_id}" }

    it 'returns a success response' do
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text' do
      result = response.body
      expect(result).to include('Here is a lists of user for a given s id')
    end
  end
end