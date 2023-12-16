# spec/models/post_spec.rb
require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to(:author).class_name('User').with_foreign_key('author_id') }
  it { should have_many(:comments) }
  it { should have_many(:likes) }

  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_most(250) }
  it { should validate_numericality_of(:comments_counter).only_integer.is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:likes_counter).only_integer.is_greater_than_or_equal_to(0) }

  describe '#update_author_posts_count' do
    it 'updates the author posts counter after saving a post' do
      user = create(:user)
      post = create(:post, author: user)

      expect(user.posts_counter).to eq(1)
    end
  end

  describe '#recent_comments' do
    it 'returns specified number of recent comments' do
      post = create(:post)
      create_list(:comment, 7, post:)

      expect(post.recent_comments(5).count).to eq(5)
    end
  end
end
