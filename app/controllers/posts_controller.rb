class PostsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    render plain: params[:article].inspect
  end
end
