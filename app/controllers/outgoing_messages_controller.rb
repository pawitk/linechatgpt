class OutgoingMessagesController < ApplicationController
  before_action :set_outgoing_message, only: %i[ show edit update destroy ]

  # GET /outgoing_messages or /outgoing_messages.json
  def index
    @outgoing_messages = OutgoingMessage.all
  end

  # GET /outgoing_messages/1 or /outgoing_messages/1.json
  def show
  end

  # GET /outgoing_messages/new
  def new
    @outgoing_message = OutgoingMessage.new
  end

  # GET /outgoing_messages/1/edit
  def edit
  end

  # POST /outgoing_messages or /outgoing_messages.json
  def create
    @outgoing_message = OutgoingMessage.new(outgoing_message_params)

    respond_to do |format|
      if @outgoing_message.save
        format.html { redirect_to outgoing_message_url(@outgoing_message), notice: "Outgoing message was successfully created." }
        format.json { render :show, status: :created, location: @outgoing_message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @outgoing_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /outgoing_messages/1 or /outgoing_messages/1.json
  def update
    respond_to do |format|
      if @outgoing_message.update(outgoing_message_params)
        format.html { redirect_to outgoing_message_url(@outgoing_message), notice: "Outgoing message was successfully updated." }
        format.json { render :show, status: :ok, location: @outgoing_message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @outgoing_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outgoing_messages/1 or /outgoing_messages/1.json
  def destroy
    @outgoing_message.destroy

    respond_to do |format|
      format.html { redirect_to outgoing_messages_url, notice: "Outgoing message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outgoing_message
      @outgoing_message = OutgoingMessage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def outgoing_message_params
      params.require(:outgoing_message).permit(:incoming_message_id, :body)
    end
end
