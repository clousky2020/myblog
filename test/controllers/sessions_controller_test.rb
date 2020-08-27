require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  # test "should get new" do
  #   get sessions_new_url
  #   assert_response :success
  # end


  test "redirect to admin after login" do
    post admin_sessions_path, params: {session: {username: ENV['ADMIN_USER'],
                                                 password: ENV['ADMIN_PASSWORD']}}
    assert_redirected_to admin_articles_url
  end
end
