class Admin::DashboardController < ApplicationController
  layout "layouts/admin"
  def index
    @articles_num = Article.count
    @comments_num =Comment.count
  end
end
