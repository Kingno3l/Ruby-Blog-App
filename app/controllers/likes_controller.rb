class LikesController < ApplicationController
  before_action :find_user_and_post, only: [:create]

  def create
    @like = @post.likes.build(user: current_user)

    respond_to do |format|
      if @like.save
        format.html { redirect_to user_posts_path(@user, @post), notice: 'Like was successfully created.' }
      else
        format.html { redirect_to user_posts_path(@user, @post), alert: 'Failed to create like.' }
      end
    end
  end

  private

  def find_user_and_post
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
  end
end
