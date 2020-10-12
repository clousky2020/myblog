class ApplicationController < ActionController::Base
  protected

  include Recruitment::SessionsHelper
  #博客
  def authenticate_login
    if !session[:login]
      flash[:warning] = "请先登录后台管理"
      cookies[:urlback] = request.original_url
      redirect_to new_admin_session_path
    end
  end

  def admin_username
    session[:login] && ENV['ADMIN_USER']
  end

  #招聘网站
  def authenticate_user
    if !session[:user_id]
      flash[:warning] = "请先登录！"
      cookies[:urlback] = request.original_url
      redirect_to new_recruitment_session_path
    end
  end
  def authenticate_company
    if !session[:company_id]
      flash[:warning] = "请先登录！"
      cookies[:urlback] = request.original_url
      redirect_to new_recruitment_session_path
    end
  end
  def user_is_company?
    unless current_user.is_admin
      flash[:warning] = "你不是企业用户，无法使用后台编辑功能"
      redirect_to recruitment_jobs_url
    end
  end


end
