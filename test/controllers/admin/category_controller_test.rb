require 'test_helper'

class Admin::CategoryControllerTest < ActionDispatch::IntegrationTest
  test '进入分类首页' do
    get admin_categorys_path
    assert_response :success
  end

end
