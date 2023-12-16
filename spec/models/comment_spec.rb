# spec/models/comment_spec.rb
require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:post) }

  describe '#update_post_comments_count' do
    let(:user) { create(:user) }
    let(:post) { create(:post) }
    let!(:comment) { create(:comment, user: user, post: post) }

    it 'updates the post comments counter after creating a comment' do
      expect { create(:comment, user: user, post: post) }.to change { post.reload.comments_counter }.by(1)
    end

    it 'updates the post comments counter after destroying a comment' do
      expect { comment.destroy }.to change { post.reload.comments_counter }.by(-1)
    end

  end
end
