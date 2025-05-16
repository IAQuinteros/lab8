class ChatsController < ApplicationController
    def index
        @chats = Chat.all
    end
    
    def show
        @chat = Chat.find(params[:id])
        @messages = @chat.messages
    end

    def new
        @chat = Chat.new
    end

    def create 
        @chat = Chat.new(chat_params)

        if @chat.save
            redirect_to chat_path(@chat), notice: "Chat creado exitosamente"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def users
        chat = Chat.find_by(id: params[:id])
        
        if chat
            users = [
                {id: chat.sender.id, email: chat.sender.email},
                {id: chat.receiver.id, email: chat.receiver.email}

            ]
            render json: users
        else 
            render json: [], status: :not_found
        end
    end

    def edit
        @chat = Chat.find(params[:id])
    end

    def update
        @chat = Chat.find(params[:id])
        if @chat.update(chat_params)
            redirect_to @chat, notice: "Chat actualizado correctamente."
        else
            render :edit
        end
    end

    private

    def chat_params
        params.require(:chat).permit(:sender_id, :receiver_id)
    end
end
