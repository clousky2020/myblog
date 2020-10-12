class CreateRecruitmentResumes < ActiveRecord::Migration[6.0]
  def change
    create_table :recruitment_resumes do |t|
      t.boolean :is_default, default: false
      t.integer :user_id
      t.string :name
      t.string :gender
      t.integer :age
      t.date :birth
      t.integer :work_age
      t.string :education
      t.string :picture
      t.string :residential_address
      t.string :job_seeking_status
      t.string :marrige_status
      t.string :household_register
      t.string :live_address_1
      t.string :live_address_2
      t.string :phone
      t.integer :to_work_time

      t.string :intention_job
      t.string :job_category
      t.string :expect_salary
      t.string :expect_work_site

      t.string :work_experience
      t.string :self_assessment
      t.string :education_and_training_experience
      t.string :project_experience
      t.string :language_abiity
      t.string :skill_speciality
      t.string :certificate
      t.string :other_info
      t.string :my_production

      t.timestamps
    end
    add_index :recruitment_resumes, [:user_id, :is_default], :unique => true

  end
end
