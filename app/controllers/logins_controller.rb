class LoginsController < ApplicationController
  def create
    reset_session
    if params.key?(:name) || params.key?(:pass)
      user = User.find_by_name params[:name]
      if user && user.authenticate(params[:pass])
        session[:user_id] = user.id
        redirect_to root_path
      else
        session[:user_id] = nil
        redirect_to root_path, alert: 'ユーザまたはパスワードが間違っています'
      end
    end
  end

  def destroy
    session[:user_id] = nil
    @current_user = nil
    redirect_to root_path
  end

end
