class WebhookController < ApplicationController
  skip_before_action :verify_authenticity_token

  def line
    render json: true
  end
end
