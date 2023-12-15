class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :comments_count
  after_destroy :comments_count
end

