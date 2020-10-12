class Admin::CommentsController < ApplicationController
  layout "admin/layouts/admin"
  before_action :authenticate_login

  before_action do
    @article = Article.find(params[:article_id])
  end

  def index
    @comments = @article.comments.order(created_at: :desc)
  end

  def destroy
    comment = @article.comments.find(params[:id])
    if comment.destroy
      flash[:notice] = '删除评论成功'
      redirect_to admin_article_comments_path(@article)
    else
      flash[:alert] = '删除失败'
      redirect_to admin_article_comments_path(@article)
    end
  end
end
