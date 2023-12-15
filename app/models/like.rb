class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_post_likes_count
  after_destroy :update_post_likes_count

  def update_post_likes_count
    post.update(likes_counter: post.likes.count)
  end
end
