class CommentsController < ApplicationController
  # http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create
    unless request.xhr?
      logger.warn "attack action detected: #{params.to_h}"
      redirect_to root_path
      return
    end
    cookies[:name] = comment_params[:name]
    cookies[:email] = comment_params[:email]
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    if @comment.save
      @comments = @article.comments.order(created_at: :desc)
      render :create_ok
    else
      render :create_fail
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    render 'comments/comment_destroy'
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :email, :content)
  end
end
