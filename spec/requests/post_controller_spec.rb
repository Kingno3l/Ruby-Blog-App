require 'rails_helper'

RSpec.describe 'PostControllers', type: :request do
  describe 'GET /index' do
    it 'should return http status for all posts' do
      get '/users/:id/posts'
      expect(response).to have_http_status(:ok)
    end

    it 'should render the posts template' do
      get '/users/:id/posts'
      expect(response).to render_template(:index)
    end

    it 'should include the correct placeholder text for all posts' do
      get '/users/:id/posts'
      expect(response.body).to include('This is to display all posts')
    end
  end

  describe 'GET /show' do
    it 'should return successfull for single post' do
      get '/users/:id/posts/:id'
      expect(response).to be_successful
    end

    it 'should render a single post template' do
      get '/users/:id/posts/:id'
      expect(response).to render_template('posts/show')
    end

    it 'should include the placeholder of a single post' do
      get '/users/:id/posts/:id'
      expect(response.body).to include('This is to display all single posts')
    end
  end
end
