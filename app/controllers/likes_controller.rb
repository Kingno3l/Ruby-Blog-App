class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @like = @post.likes.build(user: current_user)

    respond_to do |format|
      if @like.save
        format.html { redirect_to user_posts_path(@user, @post), notice: 'Like was successfully created.' }
      else
        format.html { redirect_to user_posts_path(@user, @post), alert: 'Failed to create like.' }
      end
    end
  end
end
