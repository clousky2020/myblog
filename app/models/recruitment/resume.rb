class Recruitment::Resume < ApplicationRecord
  belongs_to :recruitment_user, :class_name => 'Recruitment::User', foreign_key: 'user_id'
  has_and_belongs_to_many :recruitment_jobs, :class_name => 'Recruitment::Job',
                          :foreign_key => :recruitment_resume_id, :association_foreign_key => :recruitment_job_id
  mount_uploader :picture, PictureUploader
  validate :picture_size

  after_create :create_set_default

  def calculate_age
    self.age = Time.now.year - self.birth.year
    self.save
  end

  # 当新建简历时，检查是否已有简历，如没有，第一份简历设定为默认简历
  def create_set_default
    user = Recruitment::User.find(self.user_id)
    if !user.recruitment_resumes.find_by(is_default: true)
      self.is_default = true
      self.save
    end
  end

  private

  def picture_size
    if picture.size > 1.megabytes
      errors.add(:picture, "图片的大小应小于1MB")
    end
  end
end
