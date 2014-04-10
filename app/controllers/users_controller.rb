class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
  end

  def show
  end

  def edit   
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
          render 'edit'
    end
  end

  private

  def user_params
  	params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
  end

  #Before filters

  def correct_user
    @user = User.find(params[:id])     
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?    
  end

end
