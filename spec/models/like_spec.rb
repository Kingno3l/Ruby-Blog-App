# spec/models/like_spec.rb
require 'rails_helper'

RSpec.describe Like, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:post) }

  describe '#update_post_likes_count' do
    let(:user) { create(:user) }
    let(:post) { create(:post) }
    let!(:like) { create(:like, user:, post:) }

    it 'updates the post likes counter after creating a like' do
      expect(post.likes_counter).to eq(1)
    end

    it 'updates the post likes counter after destroying a like' do
      like.destroy
      post.reload

      expect(post.likes_counter).to eq(0)
    end
  end
end
