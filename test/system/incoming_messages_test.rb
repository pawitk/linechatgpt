require "application_system_test_case"

class IncomingMessagesTest < ApplicationSystemTestCase
  setup do
    @incoming_message = incoming_messages(:one)
  end

  test "visiting the index" do
    visit incoming_messages_url
    assert_selector "h1", text: "Incoming messages"
  end

  test "should create incoming message" do
    visit incoming_messages_url
    click_on "New incoming message"

    fill_in "Body", with: @incoming_message.body
    click_on "Create Incoming message"

    assert_text "Incoming message was successfully created"
    click_on "Back"
  end

  test "should update Incoming message" do
    visit incoming_message_url(@incoming_message)
    click_on "Edit this incoming message", match: :first

    fill_in "Body", with: @incoming_message.body
    click_on "Update Incoming message"

    assert_text "Incoming message was successfully updated"
    click_on "Back"
  end

  test "should destroy Incoming message" do
    visit incoming_message_url(@incoming_message)
    click_on "Destroy this incoming message", match: :first

    assert_text "Incoming message was successfully destroyed"
  end
end
