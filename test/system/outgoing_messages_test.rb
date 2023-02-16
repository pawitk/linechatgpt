require "application_system_test_case"

class OutgoingMessagesTest < ApplicationSystemTestCase
  setup do
    @outgoing_message = outgoing_messages(:one)
  end

  test "visiting the index" do
    visit outgoing_messages_url
    assert_selector "h1", text: "Outgoing messages"
  end

  test "should create outgoing message" do
    visit outgoing_messages_url
    click_on "New outgoing message"

    fill_in "Body", with: @outgoing_message.body
    fill_in "Incoming message", with: @outgoing_message.incoming_message_id
    click_on "Create Outgoing message"

    assert_text "Outgoing message was successfully created"
    click_on "Back"
  end

  test "should update Outgoing message" do
    visit outgoing_message_url(@outgoing_message)
    click_on "Edit this outgoing message", match: :first

    fill_in "Body", with: @outgoing_message.body
    fill_in "Incoming message", with: @outgoing_message.incoming_message_id
    click_on "Update Outgoing message"

    assert_text "Outgoing message was successfully updated"
    click_on "Back"
  end

  test "should destroy Outgoing message" do
    visit outgoing_message_url(@outgoing_message)
    click_on "Destroy this outgoing message", match: :first

    assert_text "Outgoing message was successfully destroyed"
  end
end
