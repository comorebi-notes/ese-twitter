class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #protect_from_forgery

  def current_user
    if session[:user_id]
      # @current_userがnilかfalseならログインユーザーを代入
      if User.find_by_id(session[:user_id])
        @current_user ||= User.find_by_id(session[:user_id])
      else
        @current_user = nil
        session[:user_id] = nil
      end
    end
  end

  helper_method :current_user
end
