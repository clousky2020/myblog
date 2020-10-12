require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "redirect to admin after login" do
    post admin_sessions_path, params: {session: {username: ENV['ADMIN_USER'],
                                                 password: ENV['ADMIN_PASSWORD']}}
    assert_redirected_to admin_root_path
  end

end
