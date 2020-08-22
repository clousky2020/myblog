class ArticlesController < ApplicationController
  before_action :find_article, only: [:show]
  before_action :all_comments, only: [:index]

  def index
    @articles = Article.order(:id).page params[:page]
  end

  def show
    @article.visited
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
