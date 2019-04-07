class UsersController < ApplicationController
  def show
    if user_signed_in?
      @user = authorize current_user
    else
      flash[:alert] = "Access denied"
    end
  end
  def index
    if user_signed_in?
      @user = current_user
    end
  end
  def update
    if user_signed_in?
      @user = authorize User.find_by(id: params[:id])
    end
  end
  def destroy
    if user_signed_in?
      @user = authorize User.find_by(id: params[:id])
    end
  end

  def signout
    session.clear
    flash[:alert] = "Signed out successfully."
    redirect_to '/'
  end

end
