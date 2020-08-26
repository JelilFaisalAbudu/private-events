class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      # log the user in and direct to show page
      log_in(user)
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password. Try again' # Log in not
      render 'new' # Try once more
    end
  end

  def destroy
    
  end
end
