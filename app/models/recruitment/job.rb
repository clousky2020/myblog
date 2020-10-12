class Recruitment::Job < ApplicationRecord
  belongs_to :recruitment_company, :class_name => 'Recruitment::Company', foreign_key: "company_id", dependent: :destroy
  validates :name, :description, :salary_up_limit, :salary_down_limit, presence: true
  validates :salary_down_limit, numericality: {greater_than_or_equal_to: 0}
  has_and_belongs_to_many :recruitment_resumes, :class_name => 'Recruitment::Resume',
                          :foreign_key => :recruitment_job_id, :association_foreign_key => :recruitment_resume_id


  scope :published, -> {where(:show => true)}
  scope :recent, -> {order("updated_at DESC")}

  def push
    self.update(show: !self.show)
  end

end
