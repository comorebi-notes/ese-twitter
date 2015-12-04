class PostsController < ApplicationController

  before_action :set_post

  def index
    if current_user == nil
      @post = Post.new
    else
      @post = current_user.posts.new
    end
  end

  def create
    @user = User.find(current_user)
  	@post = @user.posts.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render "index"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private

    def post_params
    	params[:post].permit(:text)
    end

    def set_post
      @posts = Post.all
      @posts = Post.order("id").reverse_order
    end

end
