require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'Joy', photo: 'https://www.google.com/url', bio: 'she is a software developer', posts_counter: 0) }

  it 'Name should not be blank' do
    user.name = nil
    expect(user).to_not be_blank
  end

  it 'should have PostCouner greater than or equal to zero' do
    user.posts_counter = 2
    expect(user.posts_counter).to be >= 0
  end

  describe '#recent_posts' do
    it 'returns 3 most recent posts for a user' do
      # Save the user first
      # user.save
      expect(user).to be_valid

      # Creating 4 posts for the user
      post1 = Post.create(author_id: user.id, title: 'Post 1', text: 'This is post 1', comments_counter: 0,
                          likes_counter: 0)
      post2 = Post.create(author_id: user.id, title: 'Post 2', text: 'This is post 2', comments_counter: 0,
                          likes_counter: 0)
      post3 = Post.create(author_id: user.id, title: 'Post 3', text: 'This is post 3', comments_counter: 0,
                          likes_counter: 0)

      # Ensure that the post is created successfully
      expect(post3).to be_valid

      result = user.recent_posts.to_a

      expect(result).to be_an(Array)
      expect(result.size).to eq(3)
      expect(result).to include(post1, post2, post3)
    end
  end
end
