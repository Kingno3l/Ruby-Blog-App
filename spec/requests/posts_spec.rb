require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(author_id: 1, title: 'Post 1', text: 'This is post 1', comments_counter: 0, likes_counter: 0) }
  # before { subject.save }
  it 'Title should not be blank' do
    subject.title = nil
    expect(subject).to_not be_blank
  end

  it 'Title should not exceed 250 characters' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'should have CommentsCouner greater than or equal to zero' do
    subject.comments_counter = 2
    expect(subject.comments_counter).to be >= 0
  end

  it 'should have LikesCouner greater than or equal to zero' do
    subject.likes_counter = 2
    expect(subject.likes_counter).to be >= 0
  end

  describe '#recent_comments' do
    let(:user) { User.create(name: 'Test User', posts_counter: 0) }
    let(:post) do
      Post.create(author: user, title: 'Test Title', text: 'Test Text', likes_counter: 0, comments_counter: 0)
    end

    it 'returns 5 most recent comments for a post' do
      # Create 6 comments for the post
      6.times { |i| Comment.create(post:, user:, text: "Comment #{i + 1}") }

      recent_comments = post.recent_comments

      expect(recent_comments.size).to eq(5)
      expect(recent_comments.first.text).to eq('Comment 6')
      expect(recent_comments.last.text).to eq('Comment 2')
    end
  end
end
