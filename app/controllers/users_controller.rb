class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end
  

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You have successfully registered"
      redirect_to root_path
    else
      flash.now[:alert] = "Something went wrong. Check and resubmit your registration form again"
      render :new
    end
  end

 
  
  

  def update
    @user= User.find(current_user.id)
    if @user.update(user_params)
      flash[:success] = "Profile successfully updated"
      redirect_to root_path
    else
      flash.now[:error] = "Something went wrong. Could not update profile"
      render :edit
    end
  end
  
  
  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
  
end
