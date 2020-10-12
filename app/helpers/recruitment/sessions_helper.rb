module Recruitment::SessionsHelper
  def login_in(user)
    session[:user_id] = user.id
  end

  def company_login_in(user)
    session[:company_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= Recruitment::User.find_by(id: session[:user_id])
    elsif session[:company_id]
      @current_company ||= Recruitment::Company.find_by(id: session[:company_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
    session.delete(:company_id)
    @current_company = nil
  end
end
