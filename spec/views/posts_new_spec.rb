require 'rails_helper'

RSpec.feature 'Post#new', type: :feature do
  let(:user) do
    User.create(id: 1, name: 'Timothy Gerard', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                bio: 'Teacher from Mexico.', posts_counter: 0)
  end

  before do
    visit new_user_post_path(user)
  end

  scenario 'displays the new post form' do
    expect(page).to have_css('h1', text: 'Create a new post')

    within('.post-form') do
      expect(page).to have_field('Post Title:', type: 'text')
      expect(page).to have_field('Post Text', type: 'textarea')
      expect(page).to have_button('Create post', class: 'form-submit')
    end
  end

  scenario 'creates a new post successfully' do
    within('.post-form') do
      fill_in 'Post Title:', with: 'New Post Title'
      fill_in 'Post Text', with: 'This is the body of the new post.'
      click_button 'Create post'
    end

    expect(page).to have_content('New Post Title')
    expect(page).to have_content('This is the body of the new post.')
  end
end
