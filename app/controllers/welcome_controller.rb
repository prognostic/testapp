class WelcomeController < ApplicationController
  #respond_to :html, :js
  
  def index; end

  def create
    @message = Message.new(message_params)
    @message.save
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
