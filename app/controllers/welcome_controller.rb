class WelcomeController < ApplicationController
  def index
    @messages = Message.order(created_at: :desc)
    @queries = Message.count
  end

  def create
    @message = Message.new(message_params)
    respond_to do |format|
      if @message.save
        format.js {}
      else
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
