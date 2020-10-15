class Recruitment::Company < ApplicationRecord
  has_many :recruitment_jobs, :class_name => 'Recruitment::Job'
  has_secure_password
  validates :company_name, :company_email, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :company_email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}

  def update_user_login_time
    self.last_login_time = Time.now
    self.save
  end
end
