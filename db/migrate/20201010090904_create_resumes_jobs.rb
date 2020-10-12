class CreateResumesJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :recruitment_jobs_resumes, id: false do |t|
      t.belongs_to :recruitment_job, index: true
      t.belongs_to :recruitment_resume, index: true

      t.timestamps
    end
  end
end
