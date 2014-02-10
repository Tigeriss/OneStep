class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
    puts "Creating new user"
  	@user = User.new(user_params)
     puts "Check if user saved"
  	if @user.save
      puts "Try to sign in"
      sign_in @user
      flash[:success] = "Welcome to our club!"
      redirect_to @user
  	else
  		render 'new'
  	end 
  end

  private

  def user_params
  	params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
  end
end
