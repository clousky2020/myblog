class CreateRecruitmentCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :recruitment_companies do |t|
      t.string :company_name, unique: true
      t.string :company_email, unique: true
      t.string :password_digest
      t.string :company_recruiter_name
      t.string :recruiter_phone
      t.string :company_phone
      t.string :company_address
      t.string :company_logo
      t.string :company_size
      t.string :company_type
      t.integer :company_date_of_establishment
      t.boolean :company_introduction, default: false
      t.string :is_certificate
      t.boolean :is_admin, default: false

      t.datetime :last_login_time
      t.timestamps
    end
    add_index :recruitment_companies, :company_email
    add_index :recruitment_companies, :company_name

  end


end
