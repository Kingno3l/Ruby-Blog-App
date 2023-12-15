class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :likes_count
  after_destroy :likes_count
end
