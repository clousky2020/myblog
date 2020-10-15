class Recruitment::CompanySessionsController < ApplicationController
  layout "recruitment/layouts/admin"

  def new
  end

  def create
    user = Recruitment::Company.find_by(company_email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      company_login_in user
      flash[:success] = "成功登录"
      redirect_to recruitment_admin_jobs_url
    else
      flash[:warning] = "错误的邮箱/密码"
      render "recruitment/company_sessions/new"
    end
  end

  def destroy
    log_out
    redirect_to recruitment_jobs_path
  end

end
