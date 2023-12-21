# spec/requests/users_spec.rb
require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'renders the index template' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'responds with a 200 status code' do
      get users_path
      expect(response).to have_http_status(200)
    end

    # Other test cases related to Users controller actions
  end
end
