class Admin::DashboardController < ApplicationController
  before_action :authenticate_login
  layout "admin/layouts/admin"

  def index
    @articles_num = Article.count
    @comments_num = Comment.count
  end
end
