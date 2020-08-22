class Comment < ApplicationRecord
  belongs_to :article
  validates :content, presence: {messsage: "评论内容不能为空"}
  validates :name, presence: {messsage: "内容不能为空"}
  validates :email, presence: {messsage: "内容不能为空"}, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "邮箱不符合格式"}
end
