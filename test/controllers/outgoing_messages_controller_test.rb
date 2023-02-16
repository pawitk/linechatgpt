require "test_helper"

class OutgoingMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @outgoing_message = outgoing_messages(:one)
  end

  test "should get index" do
    get outgoing_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_outgoing_message_url
    assert_response :success
  end

  test "should create outgoing_message" do
    assert_difference("OutgoingMessage.count") do
      post outgoing_messages_url, params: { outgoing_message: { body: @outgoing_message.body, incoming_message_id: @outgoing_message.incoming_message_id } }
    end

    assert_redirected_to outgoing_message_url(OutgoingMessage.last)
  end

  test "should show outgoing_message" do
    get outgoing_message_url(@outgoing_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_outgoing_message_url(@outgoing_message)
    assert_response :success
  end

  test "should update outgoing_message" do
    patch outgoing_message_url(@outgoing_message), params: { outgoing_message: { body: @outgoing_message.body, incoming_message_id: @outgoing_message.incoming_message_id } }
    assert_redirected_to outgoing_message_url(@outgoing_message)
  end

  test "should destroy outgoing_message" do
    assert_difference("OutgoingMessage.count", -1) do
      delete outgoing_message_url(@outgoing_message)
    end

    assert_redirected_to outgoing_messages_url
  end
end
