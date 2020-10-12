class Admin::ArticlesController < ApplicationController
  before_action :find_article, only: [:edit, :update, :destroy]
  before_action :all_comments, only: [:edit, :index, :new]
  before_action :authenticate_login
  layout "admin/layouts/admin"

  def index
    @articles = Article.searched(params[:search]).order("created_at DESC").page params[:page]
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    labels = params[:label].to_s
    initialize_or_create_labels(labels)
    @article.categories.clear
    @article.categories << Category.find(params[:article][:category_ids])
    if @article.save
      flash[:notice] = "创建成功"
      redirect_to admin_articles_url
    else
      flash.now[:alert] = "创建失败"
      render "new"
    end
  end

  def update
    @article = Article.find(params[:id])
    labels = params[:label].to_s
    initialize_or_create_labels(labels)
    @article.categories.clear
    @article.categories << Category.find(params[:article][:category_ids])
    if @article.update(article_params)
      flash[:notice] = "成功更新"
      redirect_to admin_articles_url
    else
      flash.now[:alert] = "更新失败"
      render 'edit'
    end

  end

  def destroy
    if @article.destroy and @article.categories.clear
      flash[:notice] = "文章删除成功"
      redirect_to admin_articles_url
    else
      flash[:alert] = "文章删除失败，原因是#{@article.errors.full_messages.to_s}"
      render "index"
    end
  end


  private

  def all_comments
    @comments = Comment.order("updated_at DESC")
  end

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :category_ids)
  end

  def initialize_or_create_labels(labels)
    @article.labels = []
    labels.split(/[,，]/).map {|a| a.strip}.uniq.each do |name|
      label = Label.find_or_initialize_by(name: name.strip)
      label.save!
      @article.labels << label
    end
  end
end
