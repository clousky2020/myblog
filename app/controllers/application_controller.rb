class ApplicationController < ActionController::Base
  protected

  def authenticate_user
    if !session[:login]
      flash[:error] = "请先登录后台管理"
      cookies[:urlback] = request.original_url
      redirect_to new_admin_session_path
    end
  end

  def admin_username
    session[:login] && ENV['ADMIN_USER']
  end


end
