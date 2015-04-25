class WelcomeController < ApplicationController
  def index
  end
  def about
      @posts = Post.all
      @randompic= Post.offset(rand(Post.count)).first.picture.url
  end
end
