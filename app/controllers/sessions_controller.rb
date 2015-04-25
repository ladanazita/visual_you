class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to("/users/#{@user.id}")
    else
      flash[:error] = 'Incorrect Login'
      redirect_to('/login')
    end
  end

  def destroy
    session[:user_id]=nil
    redirect_to('/')
  end

end