class Recruitment::SessionsController < ApplicationController
  layout "recruitment/layouts/admin"

  def new
  end

  def create
    user = Recruitment::User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      login_in user
      flash[:success] = "成功登录"
      redirect_to recruitment_jobs_url
    else
      flash[:warning] = "错误的邮箱/密码"
      render "recruitment/sessions/new"
    end
  end

  def destroy
    log_out
    redirect_to recruitment_jobs_path
  end

end
