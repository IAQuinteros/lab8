class MessagesController < ApplicationController
    def index
        @messages = Message.all
    end

    def show
        @message = Message.find(params[:id])
    end

    def new
        @message = Message.new
    end

    def create
        @message = Message.new(chat_params)

        if @message.save
            redirect_to new_message_path, notice: "Mensaje creado exitosamente"
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def chat_params
        params.require(:message).permit(:chat_id, :user_id, :body)
    end
end
