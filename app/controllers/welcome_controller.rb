class WelcomeController < ApplicationController
  before_action :set_default_locale

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

  def set_default_locale
    I18n.default_locale = :ru
  end
end
