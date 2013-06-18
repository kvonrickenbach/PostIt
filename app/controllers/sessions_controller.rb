class SessionsController < ApplicationController
	def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome to the site #{params[:username]}!"
    else
      flash[:error] = "There is something wrong with your username and/or password"
      redirect_to login_path
    end
  end

  def destroy
     session[:user_id] = nil
     redirect_to root_path, notice: "You are now logged out"
  end
end