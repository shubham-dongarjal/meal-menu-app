require "test_helper"

class MenuResponsesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get menu_responses_new_url
    assert_response :success
  end

  test "should get create" do
    get menu_responses_create_url
    assert_response :success
  end
end
