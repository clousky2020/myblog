class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.order(:id).page params[:page]
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    Article.create(article_params)
    redirect_to articles_url
  end

  def update
    @article.update(article_params)
    redirect_to articles_url
  end

  def destroy
    @article.destroy
    redirect_to articles_url
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
