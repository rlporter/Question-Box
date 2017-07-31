class PostsController < ApplicationController

  def index
    @posts = Post.order('published_at DESC').page params[:page]
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.published_at = DateTime.now

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :published_at)
  end
end
