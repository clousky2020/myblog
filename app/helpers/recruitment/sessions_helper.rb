module Recruitment::SessionsHelper
  def login_in(user)
    session[:user_id] = user.id
    user.update_user_login_time #更新用户的最后登录时间
  end

  def company_login_in(user)
    session[:company_id] = user.id
    user.update_user_login_time #更新用户的最后登录时间
  end

  def current_user
    if session[:user_id]
      @current_user ||= Recruitment::User.find_by(id: session[:user_id])
    end
  end

  def current_company
    if session[:company_id]
      @current_company ||= Recruitment::Company.find_by(id: session[:company_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def company_logged_in?
    !current_company.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
    session.delete(:company_id)
    @current_company = nil
  end

  private

  #暂不可用，提示找不到方法
  def update_user_login_time
    self.last_login_time = Time.now
  end
end
