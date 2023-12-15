class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  def update_user_posts_count
    author.update(posts_count: author.posts.count)
  end

  def recent_comments(count = 5)
    comments.order(created_at: :desc).limit(count)
  end
end
