class OutgoingMessage < ApplicationRecord
  belongs_to :incoming_message
end
