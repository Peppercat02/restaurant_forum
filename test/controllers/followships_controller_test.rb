require 'test_helper'

class FollowshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get followships_index_url
    assert_response :success
  end

end
