class IncomingMessagesController < ApplicationController
  before_action :set_incoming_message, only: %i[ show edit update destroy ]

  # GET /incoming_messages or /incoming_messages.json
  def index
    @incoming_messages = IncomingMessage.all
  end

  # GET /incoming_messages/1 or /incoming_messages/1.json
  def show
  end

  # GET /incoming_messages/new
  def new
    @incoming_message = IncomingMessage.new
  end

  # GET /incoming_messages/1/edit
  def edit
  end

  # POST /incoming_messages or /incoming_messages.json
  def create
    @incoming_message = IncomingMessage.new(incoming_message_params)

    respond_to do |format|
      if @incoming_message.save
        format.html { redirect_to incoming_message_url(@incoming_message), notice: "Incoming message was successfully created." }
        format.json { render :show, status: :created, location: @incoming_message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @incoming_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incoming_messages/1 or /incoming_messages/1.json
  def update
    respond_to do |format|
      if @incoming_message.update(incoming_message_params)
        format.html { redirect_to incoming_message_url(@incoming_message), notice: "Incoming message was successfully updated." }
        format.json { render :show, status: :ok, location: @incoming_message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @incoming_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incoming_messages/1 or /incoming_messages/1.json
  def destroy
    @incoming_message.destroy

    respond_to do |format|
      format.html { redirect_to incoming_messages_url, notice: "Incoming message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incoming_message
      @incoming_message = IncomingMessage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def incoming_message_params
      params.require(:incoming_message).permit(:body)
    end
end
