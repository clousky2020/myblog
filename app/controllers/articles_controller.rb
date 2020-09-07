class ArticlesController < ApplicationController
  before_action :find_article, only: [:show]
  before_action :all_comments, only: [:index, :search]
  before_action :all_categories
  before_action :all_labels


  def index
    @articles = Article.order("created_at DESC").page params[:page]
  end

  def show
    @article.increment!(:views, 1)
    @catalog = @article.content.scan(/<h\d>(.*)<\/h\d>/).flatten #得到各个标题，用作后面目录的跳转
  end

  def about

  end

  def search
    if params[:category]
      @articles = Category.find_by(name: params[:category]).articles.order("created_at DESC").page params[:page]
    elsif params[:search]
      @articles = Article.searched(params[:search]).order("created_at DESC").page params[:page]
    elsif params[:label]
      @articles = Label.find_by(name: params[:label].strip).articles.order("created_at DESC").page params[:page]
    end
    render 'articles/refresh_index'
  end

  private

  def all_comments
    @comments = Comment.order("updated_at DESC")
  end

  def all_categories
    @categories = Category.joins(:articles).collect {|a| a.name}.uniq
  end

  def all_labels
    @labels = Label.joins(:articles).collect {|a| a.name}.uniq
  end

  def find_article
    @article = Article.find(params[:id])
  end

end
