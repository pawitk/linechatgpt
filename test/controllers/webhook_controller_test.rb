require "test_helper"

class WebhookControllerTest < ActionDispatch::IntegrationTest
  test "should get line" do
    get webhook_line_url
    assert_response :success
  end
end
