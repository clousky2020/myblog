class Recruitment::CompanyRegisterController < ApplicationController
  layout "recruitment/layouts/admin"

  def new
    @company_user = Recruitment::Company.new
  end

  def create
    @company_user = Recruitment::Company.new(company_user_params)

    if params[:company_user][:password].empty?
      @company_user.errors.add(:password, "不能为空")
      render "recruitment/company_register/new"
    elsif params[:company_user][:password] != params[:company_user][:password_confirmation]
      @company_user.errors.add("确认的密码不同，请重新输入!")
      render "recruitment/company_register/new"
    elsif @company_user.save
      flash[:success] = "成功创建用户"
      company_login_in(@company_user)
      redirect_to recruitment_root_path
    else
      flash[:warning] = "创建企业用户失败，#{@company_user.errors.full_messages.to_s}"
      render "recruitment/company_register/new"
    end
  end

  private

  def company_user_params
    params.require(:company_user).permit(:company_name, :company_email, :password, :password_confirmation)
  end

end
