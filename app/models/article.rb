class Article < ApplicationRecord
  validates :title, uniqueness: {message: "已有该标题"},
            length: {maximum: 50, message: "长度不能超过50个字符"},
            presence: {message: "内容不能为空"}
  validates :content, presence: {message: "内容不能为空"}
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :labels
  has_and_belongs_to_many :categories


  def labels_content(need_blank = false)
    content = self.labels.collect {|label| label.name}.join(", ")
    content = 'none' if content.blank? and !need_blank
    content
  end


  def self.searched(search)
    if search
      where("title LIKE ? or content LIKE ?", "%#{search}%", "%#{search}%")
    else
      all
    end
  end

  def change_title_id
    text = self.content
    pattern = /<h\d>.*<\/h\d>/
    matchs = text.scan(pattern)
    matchs.each do |string|
      h_num = string.match(/<h(\d)>/)[-1]
      id_text = string.match(/>(.*)</)[-1]
      text.sub!(pattern, "<h#{h_num} id='#{id_text}'>#{id_text}</h#{h_num}>")
    end
    text
  end

end
