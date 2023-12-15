class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  after_save :update_author_posts_count

  def update_author_posts_count
    author.update(posts_counter: author.posts.count)
  end

  def recent_comments(count = 5)
    comments.order(created_at: :desc).limit(count)
  end
end
