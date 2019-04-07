class UsersController < ApplicationController
  def show
    if user_signed_in?
      @user = authorize User.find_by(id: params[:id])
    end
  end
  def index
    if user_signed_in?
      @user = authorize current_user
    end
  end
  def update
    if user_signed_in?
      @user = authorize current_user
    end
  end
  def destroy
  end



end
