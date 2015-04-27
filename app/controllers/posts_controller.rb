class PostsController < ApplicationController
  before_action :require_user, except: [:index, :show]
  def index
    @posts = Post.all
    @randompic= Post.offset(rand(Post.count)).first.picture.url
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to user_path(current_user.id)
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
    def post_params
        params.require(:post).permit(:title, :picture, :user_id)
    end
end
