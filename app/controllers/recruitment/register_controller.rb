class Recruitment::RegisterController < ApplicationController
  layout "recruitment/layouts/admin"

  def new
    @user = Recruitment::User.new
  end

  def create
    @user = Recruitment::User.create(user_params)
    if @user.save
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
