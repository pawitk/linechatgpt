require "test_helper"

class IncomingMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @incoming_message = incoming_messages(:one)
  end

  test "should get index" do
    get incoming_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_incoming_message_url
    assert_response :success
  end

  test "should create incoming_message" do
    assert_difference("IncomingMessage.count") do
      post incoming_messages_url, params: { incoming_message: { body: @incoming_message.body } }
    end

    assert_redirected_to incoming_message_url(IncomingMessage.last)
  end

  test "should show incoming_message" do
    get incoming_message_url(@incoming_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_incoming_message_url(@incoming_message)
    assert_response :success
  end

  test "should update incoming_message" do
    patch incoming_message_url(@incoming_message), params: { incoming_message: { body: @incoming_message.body } }
    assert_redirected_to incoming_message_url(@incoming_message)
  end

  test "should destroy incoming_message" do
    assert_difference("IncomingMessage.count", -1) do
      delete incoming_message_url(@incoming_message)
    end

    assert_redirected_to incoming_messages_url
  end
end
