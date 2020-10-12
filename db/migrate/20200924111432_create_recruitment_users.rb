class CreateRecruitmentUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :recruitment_users do |t|
      t.string :name
      t.string :email, unique: true
      t.string :password_digest
      t.datetime :last_login_time

      t.timestamps
    end

    add_index :recruitment_users, :email
  end


end
