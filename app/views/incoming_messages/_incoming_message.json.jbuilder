json.extract! incoming_message, :id, :body, :created_at, :updated_at
json.url incoming_message_url(incoming_message, format: :json)
