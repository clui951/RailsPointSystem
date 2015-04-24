class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    flash[:notif] = "Signed In!"
    if not current_user.organization
      # redirect_to organization_new_path
    end
    redirect_to root_path, :notice => "Signed In!"
  end

  def destroy
    session[:user_id] = nil
	flash[:notif] = "Signed Out!"
    redirect_to root_path, :notice => "Signed Out!"
  end

end
