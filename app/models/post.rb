class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 } # Validates presence and maximum length of title

  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 } # Validates comments_counter as an integer greater than or equal to zero

  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 } # Validates likes_counter as an integer greater than or equal to zero

  after_save :update_author_posts_count

  def update_author_posts_count
    author.update(posts_counter: author.posts.count)
  end

  def recent_comments(count = 5)
    comments.order(created_at: :desc).limit(count)
  end
end
