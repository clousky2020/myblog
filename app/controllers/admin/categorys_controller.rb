class Admin::CategorysController < ApplicationController
  layout "admin/layouts/admin"

  def index
    @categorys = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "成功创建分类名称"
      redirect_to admin_categorys_path
    else
      flash[:error] = "创建分类失败，原因是#{@category.errors.full_messages.to_s}"
      render "new"
    end
  end


  def destroy
    @category = Category.find(params[:id])
    if @category.destroy and @category.articles.clear
      flash[:success] = "成功删除分类"
      redirect_to admin_categorys_path
    else
      flash[:error] = "删除失败,原因是#{@category.errors.full_messages.to_s}"
      render "index"
    end

  end

  def category_params
    params.require(:category).permit(:name)
  end
end
