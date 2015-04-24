class WelcomeController < ApplicationController
  def index
  end
  def about
      @posts = Post.all
      @min = Post.first.id
      @max = Post.last.id
      @randomid = rand(@min...@max)
      @randompic = Post.find_by_id(@randomid).picture.url
  end
end
