require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'after_save update_comments_counter' do
    let(:user) do
      User.create(
        name: 'Test User',
        photo: 'https://example.com',
        bio: 'Test Bio',
        posts_counter: 0
      )
    end

    let(:post) do
      Post.create(
        author_id: user.id,
        title: 'Test Post',
        text: 'This is a test post',
        comments_counter: 0,
        likes_counter: 0
      )
    end

    let(:comment) do
      Comment.new(
        user:,
        post:,
        text: 'Test Comment'
      )
    end

    it 'updates comments_counter for associated post after comment save' do
      expect { comment.save }.to change { Post.find(post.id).comments_counter }.by(1)
    end
  end
end
