class Article < ApplicationRecord
  validates :title, uniqueness: {message: "已有该标题"},
            length: {maximum: 50, message: "长度不能超过50个字符"},
            presence: {message: "内容不能为空"}
  validates :content, presence: {message: "内容不能为空"}
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :labels


  def labels_content(need_blank = false)
    content = self.labels.collect {|label| label.name}.join(", ")
    content = 'none' if content.blank? and !need_blank
    content
  end

  def visited
    self.views += 1
    self.save
    self.views
  end

  def self.searched(search)
    if search
      where("title LIKE ? or content LIKE ?", "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end
