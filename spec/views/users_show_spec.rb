require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  let!(:user) do
    user = User.create(
      name: 'Tom',
      photo: 'https://example.com/photo.jpg',
      bio: 'A bio about Tom.',
      posts_counter: 3
    )
    user.posts.create([
                        { title: 'First post', text: 'This is the first post.', comments_counter: 2, likes_counter: 5 },
                        { title: 'Second post', text: 'This is the second post.', comments_counter: 1,
                          likes_counter: 3 },
                        { title: 'Third post', text: 'This is the third post.', comments_counter: 0, likes_counter: 7 }
                      ])
    user.update(posts_counter: user.posts.count)
    user.reload
  end

  before do
    visit user_path(user)
  end

  it 'displays the user\'s profile picture' do
    expect(page).to have_selector("img[src='https://example.com/photo.jpg']")
  end

  it 'displays the user\'s username' do
    expect(page).to have_content('Tom')
  end

  it 'displays the number of posts the user has written' do
    expect(page).to have_content("Number of posts: #{user.posts_counter}")
  end

  it 'displays the user\'s bio' do
    expect(page).to have_content('A bio about Tom.')
  end

  it 'displays the user\'s first three posts' do
    expect(page).to have_content('First post')
    expect(page).to have_content('Second post')
    expect(page).to have_content('Third post')
  end

  it 'has a button to view all user posts' do
    expect(page).to have_link('See all Post', href: user_posts_path(user))
  end

  it 'redirects to post show page when a user\'s post is clicked' do
    click_link('First post')
    expect(page).to have_current_path(user_posts_path(user))
  end

  it 'redirects to user\'s post index page when clicking "See all Post"' do
    click_link('See all Post')
    expect(page).to have_current_path(user_posts_path(user))
  end
end
