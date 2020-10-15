require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "文章评论不能脱离文章" do
    @article = Article.new(title: "test", content: "text")
    @article.save
    comment = @article.comments.create(name:"test",content: "测试用的评论",email:"123@qq.com")
    assert comment.save
  end
  test "文章评论不能单独存在" do
    comment = Comment.new
    assert_not comment.save
  end
end
