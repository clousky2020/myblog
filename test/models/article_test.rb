require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def setup
    @article = Article.new(title: "test", content: "text")
  end

  test "文章标题必须存在" do
    @article.title = ""
    assert_not @article.valid?
  end
  test "文章标题长度不能超过50个字符" do
    @article.title = "a" * 51
    assert_not @article.valid?
  end
  test "文章内容必须存在" do
    @article.content = ""
    assert_not @article.valid?
  end

end
