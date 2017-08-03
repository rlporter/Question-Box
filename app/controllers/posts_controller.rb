class PostsController < ApplicationController
  # before_action :logged_in_user, only: [:index, :show, :edit, :update]
  # before_action :correct_user,   only: [:edit, :update]


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

  def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root) unless @user == current_user
    end
end
