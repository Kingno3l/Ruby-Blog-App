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


#    first_post = Post.create(author: first_user, title: 'Hello first user first post', text: 'This is my first post as a first user')
#    second_post = Post.create(author: second_user, title: 'Hello second user first post', text: 'This is my first post as a second user')
#    third_post = Post.create(author: first_user, title: 'Hello first user second post', text: 'This is my second post as a first user')
#    fourth_post = Post.create(author: second_user, title: 'Hello second user second post', text: 'This is my second post as a second user')
#    fifth_post = Post.create(author: first_user, title: 'Hello first user third post', text: 'This is my third post as a first user')
#    sixth_post = Post.create(author: second_user, title: 'Hello second user third post', text: 'This is my third post as a second user')
