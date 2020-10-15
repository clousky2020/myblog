class Recruitment::RegisterController < ApplicationController
  layout "recruitment/layouts/admin"

  def new
    @user = Recruitment::User.new
  end

  def create
    @user = Recruitment::User.new(user_params)

    if params[:user][:password].empty?
      @user.errors.add(:password, "不能为空")
      render "recruitment/register/new"
    elsif params[:user][:password] != params[:user][:password_confirmation]
      @user.errors.add("确认的密码不同，请重新输入!")
      render "recruitment/register/new"
    elsif @user.save!
      flash[:success] = "成功创建用户"
      login_in(@user)
      redirect_to recruitment_root_path
    else
      flash[:warning] = "创建用户失败，#{@user.errors.full_messages.to_s}"
      render "recruitment/register/new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
