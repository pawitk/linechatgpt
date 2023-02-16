json.extract! outgoing_message, :id, :incoming_message_id, :body, :created_at, :updated_at
json.url outgoing_message_url(outgoing_message, format: :json)
