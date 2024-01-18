require 'rails_helper'

RSpec.describe 'Users Index Page', type: :feature do
  before do
    User.create(name: 'Tom',
                photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 3)
    User.create(name: 'Lilly',
                photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.', posts_counter: 2)
  end

  it 'displays usernames of all users' do
    visit users_path
    expect(page).to have_content('Tom')
    expect(page).to have_content('Lilly')
  end

  it 'displays profile pictures of all users' do
    visit users_path
    expect(page).to have_selector("img[src*='unsplash']")
  end

  it 'displays the number of posts for each user' do
    visit users_path
    expect(page).to have_content('Number of posts: 3')
    expect(page).to have_content('Number of posts: 2')
  end

  it 'redirects to user show page when user is clicked' do
    visit users_path
    click_link('Tom')
    expect(page).to have_current_path(user_path(User.find_by(name: 'Tom')))
  end
end
