class UsersController < ApplicationController
	def new
		@user = User.new
	end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to root_path, notice: "Thank you for registering"
    else
      @user.errors.delete(:password_digest)
      render :new
    end
  end
end