class WebhookController < ApplicationController
  def line
    render json: true
  end
end
