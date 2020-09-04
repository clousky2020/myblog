class ArticlesController < ApplicationController
  before_action :find_article, only: [:show]
  before_action :all_comments, only: [:index]

  def index
    @articles = Article.searched(params[:search]).order("created_at DESC").page params[:page]
  end

  def show
    @article.increment!(:views, 1)
    @catalog = @article.content.scan(/<h\d>(.*)<\/h\d>/).flatten #得到各个标题，用作后面目录的跳转

  end

  def about

  end

  private

  def all_comments
    @comments = Comment.order("updated_at DESC")
  end

  def find_article
    @article = Article.find(params[:id])
  end

end
