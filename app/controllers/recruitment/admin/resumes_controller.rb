class Recruitment::Admin::ResumesController < ApplicationController
  before_action :authenticate_user
  layout "recruitment/admin/layouts/admin"

  def new
  end

  def edit
  end

  def show
    @user = Recruitment::User.find(params[:user_id])
    @resume = @user.recruitment_resumes.find(params[:id])
    #如果不存在第一份简历，则创建
    if !@resume
      @user.recruitment_resumes.create
    end
  end

  def update
    @user = Recruitment::User.find(params[:user_id])
    @resume = @user.recruitment_resumes.find(params[:id])
    if @resume.update(resumes_params)
      @resume.calculate_age
      flash[:notice] = "成功更新"
      render 'recruitment/admin/resumes/update_ok'
    else
      flash[:warning] = "更新失败,原因是#{@user.errors.full_messages.to_s}"
      render 'recruitment/admin/resumes/update_failer'
    end
  end

  def send_resume
    job = Recruitment::Job.find(params[:user_id])
    user = current_user
    #检查目前的用户是不是个人用户
    if user
      resume = user.recruitment_resumes.find_by(is_default: true)
      if !job.recruitment_resumes.exists?(resume.id)
        job.recruitment_resumes << resume
      end
      # flash[:notice] = "成功投递简历了"
      render 'recruitment/admin/resumes/send_resumn'
    else
      # flash[:warning] = "只有个人用户才能投递简历"
      render 'recruitment/admin/resumes/send_resumn_faile'
    end
  end

  private

  def resumes_params
    params.require(:recruitment_resume).permit(:name, :gender, :work_age, :education, :residential_address, :job_seeking_status,
                                               :marrige_status, :household_register, :phone, :to_work_time, :intention_job,
                                               :job_category, :expect_salary, :expect_work_site, :work_experience, :self_assessment,
                                               :education_and_training_experience, :project_experience, :language_abiity,
                                               :skill_speciality, :certificate, :other_info, :my_production, :birth, :live_address_1,
                                               :live_address_2, :picture)
  end
end
