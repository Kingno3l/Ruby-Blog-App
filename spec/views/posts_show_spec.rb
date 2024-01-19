require 'rails_helper'

RSpec.describe 'posts/show', type: :view do
  let(:user) { User.create(id: 1, name: 'John Doe', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Lorem ipsum', posts_counter: 2) }
  let!(:post) do
    Post.create(id: 1, author: user, title: 'Test Post', text: 'This is a test post', comments_counter: 2,
                likes_counter: 5)
  end

  before do
    assign(:post, post)
    render
  end

  it 'renders post details and comments' do
    expect(rendered).to have_selector('.post-section-container')
    expect(rendered).to have_selector('.post-section-content')
    expect(rendered).to have_content(post.title)
    expect(rendered).to have_content("Comments: #{post.comments_counter}, Likes: #{post.likes_counter}")
    expect(rendered).to have_content(post.text)

    expect(rendered).to have_selector('.post-section-comment-container')
    expect(rendered).to have_selector('.post-section-comment-container p', count: post.comments.count)

    post.comments.each do |comment|
      expect(rendered).to have_content("#{comment.user.name} : #{comment.text}")
    end
  end
end
