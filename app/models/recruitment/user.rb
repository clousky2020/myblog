class Recruitment::User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}
  has_many :recruitment_resumes, :class_name => 'Recruitment::Resume', dependent: :destroy

  def get_default_resume
    self.recruitment_resumes.find_by(is_default: true)
  end

  def update_user_login_time
    self.last_login_time = Time.now
    self.save
  end

  def user_resume_exists_IfNoTo_create
    if !self.recruitment_resumes.find_by(is_default: true)
      self.recruitment_resumes.create
    end
  end

end
