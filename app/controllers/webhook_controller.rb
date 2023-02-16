class WebhookController < ApplicationController
  skip_before_action :verify_authenticity_token

  def line
    IncomingMessage.create(body: params.to_json)
    render json: true
  end
end
