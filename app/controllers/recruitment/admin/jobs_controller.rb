class Recruitment::Admin::JobsController < ApplicationController
  before_action :authenticate_company
  before_action :find_id, only: [:show, :edit, :update, :destroy, :push]
  layout "recruitment/admin/layouts/admin"

  def index
    user = Recruitment::Company.find(session[:company_id])
    @jobs = user.recruitment_jobs.order("updated_at DESC").page(params[:page]).per(20)
  end

  def new
    @job = Recruitment::Job.new
  end

  def create
    @user = current_user
    @user.recruitment_jobs.build(job_params)
    if @user.save!
      flash[:notice] = "成功创建"
      redirect_to recruitment_admin_jobs_url
    else
      flash[:warning] = "创建失败,原因是#{@job.errors.full_messages.to_s},#{@user.errors.full_messages.to_s}"
      render 'recruitment/admin/jobs/new'
    end
  end

  def edit

  end

  def show

  end

  def update
    if @job.update(job_params)
      flash[:notice] = "成功更新"
      redirect_to recruitment_admin_jobs_url
    else
      flash[:warning] = "更新失败,原因是#{@job.errors.full_messages.to_s}"
      render 'recruitment/admin/jobs/edit'
    end
  end

  def destroy
    if @job.destroy
      flash[:notice] = "成功删除"
      redirect_to recruitment_admin_jobs_url
    else
      flash[:warning] = "更新失败,原因是#{@job.errors.full_messages.to_s}"
      render recruitment_admin_jobs_url
    end
  end

  def push
    if @job.push
      flash[:notice] = "简历更换状态成功"
    else
      flash[:warning] = "简历更换状态失败,原因是#{@job.errors.full_messages.to_s}"
    end
    redirect_to recruitment_admin_jobs_url
  end

  def job_resumes
    @job = Recruitment::Job.find(params[:id])
    @resumes = @job.recruitment_resumes
  end

  private

  def find_id
    @job = Recruitment::Job.find(params[:id])

  end

  def job_params
    params.require(:recruitment_job).permit(:name, :description, :work_age, :salary_up_limit, :salary_down_limit,
                                            :contact, :work_area, :detailed_address, :show, :gender, :hiring_number,
                                            :min_age, :max_age, :language_requirement, :recruitment_department)
  end
end

