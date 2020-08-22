class Admin::SessionsController < ApplicationController

  def new
  end

  def create
    if ENV['ADMIN_USER'].blank?
      flash.now[:alert] = "后台没有设定好账户密码，请联系管理员"
      render :new
    elsif ENV['ADMIN_USER'] != params[:session][:username]
      flash.now[:alert] = "账户错误"
      render :new
    elsif ENV['ADMIN_PASSWORD'] != params[:session][:password]
      flash.now[:alert] = "密码错误"
      render :new
    else
      flash[:notice] = "登录成功"
      session[:login] = true
      if cookies[:urlback]
        redirect_to cookies[:urlback]
        cookies[:urlback] = nil
      else
        redirect_to articles_path
      end
    end
  end

  def destroy
    session[:login] = nil
    redirect_to new_admin_session_path
  end
end
