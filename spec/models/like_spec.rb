require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#update_likes_counter' do
    let(:user) { User.create(name: 'Test User', photo: 'https://example.com', bio: 'Test Bio', posts_counter: 0) }
    let(:post) do
      Post.create(author_id: user.id, title: 'Test Post', text: 'This is a test post', comments_counter: 0,
                  likes_counter: 0)
    end
    let!(:like) { Like.create(user:, post:) } # Create a like beforehand

    it 'validates post creation' do
      expect(post).to be_valid
    end

    it 'updates likes_counter for associated post after like creation' do
      expect do
        Like.create(user:, post:)
        post.reload
      end.to change { post.likes_counter }.by(1)
    end
  end
end
