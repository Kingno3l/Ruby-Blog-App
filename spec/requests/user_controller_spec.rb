require 'rails_helper'

RSpec.describe 'UserControllers', type: :request do
  describe 'GET /index' do
    it 'should return http status for all users' do
      get '/users'
      expect(response).to have_http_status(:ok)
    end

    it 'should render the template page of all users' do
      get '/users'
      expect(response).to render_template('users/index')
    end

    it 'should include the placeholder text of all users' do
      get '/users'
      expect(response.body).to include('This is to display all users')
    end
  end

  describe 'GET / show' do
    it 'should return http status for a single users' do
      get '/users/:id'
      expect(response).to have_http_status(:ok)
    end

    it 'should render the template page of a single users' do
      get '/users/:id'
      expect(response).to render_template(:show)
    end

    it 'should include the placeholder text for a single user' do
      get '/users/:id'
      expect(response.body).to include('This is to display a single user')
    end
  end
end
