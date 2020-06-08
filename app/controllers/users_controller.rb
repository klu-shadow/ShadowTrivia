class UsersController < ApplicationController
  def index
    #temporary index to see login/register redirect
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        login!(@user)
        redirect_to users_url
    else
        render json: @user.errors.full_messages, status: 401
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
