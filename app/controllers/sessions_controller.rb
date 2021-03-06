class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by_auth(request.env["omniauth.auth"])
    if user
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    flash[:notice] = {color: "white", message: "Goodbye"}
    redirect_to root_path
  end
end
