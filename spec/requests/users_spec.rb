require 'rails_helper'

RSpec.describe UsersController, type: :request do
  let(:user_id) { 802 }

  describe 'GET /index' do
    before { get '/users/' }

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
    before { get "/users/#{user_id}" }

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
