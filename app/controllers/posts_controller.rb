class PostsController < ApplicationController
  def index
    timeline_users_ids = [current_user.id] + current_user.friends.ids
    all_posts = Post.order('created_at DESC')
    @timeline_posts = all_posts.select {|post| timeline_users_ids.include?(post.creator.id)}
    @other_posts = all_posts.select {|post| !timeline_users_ids.include?(post.creator.id)}
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  private

  def post_params
    params.require(:post).permit(:creator_id, :content, :image)
  end
end
