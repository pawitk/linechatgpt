require 'rest-client'

class WebhookController < ApplicationController
  skip_before_action :verify_authenticity_token

  def line
    incoming = IncomingMessage.create(body: params.to_json)

    event = params['events'].first
    message = event['message']['text']
    reply_token = event['replyToken']

    @resource = RestClient::Resource.new('https://api.openai.com/v1/completions')
    @response = @resource.post({
      "model" => "text-davinci-003",
      "prompt" => message,
      "max_tokens" => 20,
      "temperature" => 0
    }, :Authorization => "Bearer #{Rails.application.credentials.openai_api_key}" )

    outgoing = OutgoingMessage.create(incoming_message: incoming, body: @response.body.to_json)

    render json: true
  end
end
