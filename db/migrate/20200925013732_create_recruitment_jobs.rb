class CreateRecruitmentJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :recruitment_jobs do |t|
      t.belongs_to :company
      t.string :name, presence: true
      t.text :description
      t.string :work_type
      t.integer :work_age
      t.integer :salary_up_limit, default: 0
      t.integer :salary_down_limit, default: 0
      t.string :work_area
      t.string :detailed_address
      t.boolean :show, default: false
      t.integer :views, default: 0
      t.integer :hiring_number, default: 1
      t.integer :min_age, default: 18
      t.integer :max_age, default: 70
      t.string :language_requirement
      t.string :gender
      t.string :recruitment_department
      t.string :education

      t.timestamps
    end
  end
end
