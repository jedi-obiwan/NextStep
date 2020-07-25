class ApplicationController < ActionController::Base
# User認証
  def authenticate_user
    if session[:user_id] == nil
      flash[:notice] = "please login"
      redirect_to("/login")
    end
  end
end
