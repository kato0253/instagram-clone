class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  include SessionsHelper

  def set_current_user
   @current_user = User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if @current_user == session[:user_id]
      flash[:notice] = "ログインが必要です"
      redirect_to("/contacts/new")
    end
  end

end
