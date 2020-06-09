class SessionsController < ApplicationController
  def new
      
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if user
      login!(user)
      redirect_to users_url
    else
      flash[:errors] = ["Invalid email address or password."]
      redirect_to new_session_url
    end
  end

  def destroy
      logout!
      redirect_to new_session_url
  end

end
