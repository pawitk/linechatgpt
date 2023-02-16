require 'rest-client'

class WebhookController < ApplicationController
  skip_before_action :verify_authenticity_token

  def line
    incoming = IncomingMessage.create(body: params.to_json)

    event = params['events'].first
    message = event['message']['text']
    reply_token = event['replyToken']

    @request_body = {"model" => "text-davinci-003","prompt" => message,"max_tokens" => 20,"temperature" => 0}
    @response = RestClient.post('https://api.openai.com/v1/completions',@request_body.to_json,:content_type => 'application/json', :authorization => "Bearer #{Rails.application.credentials.openai_api_key}")

    outgoing = OutgoingMessage.create(incoming_message: incoming, body: @response.body)

    @response_json = JSON.parse(@response.body)
    @response_message = @response_json['choices'].first['text']

    @reply_body = {
      "replyToken" => reply_token,
      "messages" => [
          {
              "type" => "text",
              "text" => @response_message.strip
          }
      ]
    }
    RestClient.post('https://api.line.me/v2/bot/message/reply',@reply_body.to_json,:content_type => 'application/json', :authorization => "Bearer #{Rails.application.credentials.line_channel_access_token}")

    render json: true
  end
end
