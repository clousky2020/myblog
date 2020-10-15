class Recruitment::JobsController < ApplicationController

  layout "recruitment/layouts/admin"

  def index
    @jobs = case params[:order]
            when 'by_salary_lower'
              Recruitment::Job.published.order("salary_down_limit DESC").page(params[:page]).per(20)
            when 'by_salary_upper'
              Recruitment::Job.published.order("salary_up_limit DESC").page(params[:page]).per(20)
            else
              Recruitment::Job.published.recent.page(params[:page]).per(20)
            end
  end

  def show
    @job = Recruitment::Job.find(params[:id])
    @job.increment!(:views, 1)
  end

  def job_search
    if params[:search]
      @jobs = Recruitment::Job.published.where('name LIKE ?', "%#{params[:search]}%").order("created_at DESC").page(params[:page])
    end
    render 'recruitment/jobs/refresh_index'
  end


end
