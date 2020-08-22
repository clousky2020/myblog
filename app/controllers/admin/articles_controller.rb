class Admin::ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :all_comments, only: [:show, :edit, :index, :new]
  before_action :authenticate_user

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    labels = params[:label].to_s
    initialize_or_create_labels(labels)
    if @article.save
      flash[:notice] = "创建成功"
      redirect_to articles_url
    else
      flash.now[:error] = "创建失败"
      render articles_url
    end
  end

  def update
    @article = Article.find(params[:id])
    labels = params[:label].to_s
    initialize_or_create_labels(labels)
    if @article.update(article_params)
      flash[:notice] = "成功更新"
      redirect_to articles_url
    else
      flash.now[:error] = "更新失败"
      render :edit
    end

  end

  def destroy
    @article.destroy
    redirect_to articles_url
  end


  private

  def all_comments
    @comments = Comment.order("updated_at DESC")
  end

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
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
