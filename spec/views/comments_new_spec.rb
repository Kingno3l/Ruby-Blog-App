require 'rails_helper'

RSpec.feature 'Comments#new', type: :feature do
  let(:user) do
    User.create(id: 1, name: 'John Doe', photo: 'testPicture1.jpg', bio: 'Lorem ipsum', posts_counter: 2)
  end

  let(:post) do
    Post.create(id: 1, author: user, title: 'Test Post', text: 'This is a test post', comments_counter: 2,
                likes_counter: 5)
  end

  before do
    visit new_user_post_comment_path(user, post)
  end

  scenario 'displays the new comment form' do
    expect(page).to have_css('h1', text: 'Create a comment for the post')

    within('form') do
      expect(page).to have_field('Post comment', type: 'text')
      expect(page).to have_button('Submit comment')
    end
  end

  scenario 'creates a new comment successfully' do
    within('form') do
      fill_in 'Post comment', with: 'This is a new comment.'
      click_button 'Submit comment'
    end
    expect(page).to have_content('This is a new comment.')
  end
end
