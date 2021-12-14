class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]
  before_action :admin_only, only: [ :update, :destroy ]
  invisible_captcha only: [ :create ], honeypot: :subtitle

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        AdminMailer.new_message(@message).deliver
        format.html { redirect_to root_path, notice: "Thanks for reaching out!  Your message has been sent and we'll get back to you shortly." }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to admin_messages_path, notice: "Message was successfully updated." }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to admin_messages_path, notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def mark_answered
      @message = Message.find(params[:id])
      if @message.update(answered: true)
          redirect_to admin_messages_path
          flash[:notice] = "Oh you answered the heck out of that one! *high five*"
      else
          redirect_to root_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end

  def mark_unanswered
      @message = Message.find(params[:id])
      if @message.update(answered: false)
          redirect_to admin_messages_path
          flash[:notice] = "Uh oh, it's supposed to go the other direction!  Well, now it's marked unanswered...again..."
      else
          redirect_to root_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(
        :message_type,
        :from_name,
        :from_email,
        :subject,
        :body,
        :answered
      )
    end
end
