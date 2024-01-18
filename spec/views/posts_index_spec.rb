require 'rails_helper'

RSpec.feature 'Posts#index', type: :feature do
  let(:user) { User.create(id: 1, name: 'John Doe', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Lorem ipsum', posts_counter: 2) }
  let!(:post1) do
    Post.create(id: 1, author: user, title: 'First Post', text: 'This is the body of the first post',
                comments_counter: 2, likes_counter: 5)
  end
  let!(:post2) do
    Post.create(id: 2, author: user, title: 'Second Post', text: 'This is the body of the second post',
                comments_counter: 3, likes_counter: 8)
  end

  before { visit user_posts_path(user) }

  scenario 'displaying user information and posts' do
    expect(page).to have_css('.user-posts-img')
    expect(page).to have_content(user.name)
    expect(page).to have_content("Number of posts: #{user.posts_counter}")

    [post1, post2].each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text)
      expect(page).to have_content("Comments: #{post.comments_counter}, Likes: #{post.likes_counter}")
    end
  end

  scenario 'redirect to post show page on post click' do
    click_link 'First Post'
    expect(current_path).to eq(user_post_path(user, post1))
  end

  scenario 'displaying pagination button' do
    Post.create(id: 3, author: user, title: 'Third Post', text: 'This is the body of the third post',
                comments_counter: 1, likes_counter: 2)
    visit user_posts_path(user)
    expect(page).to have_button('Pagination')
  end
end
