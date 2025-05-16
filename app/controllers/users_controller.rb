class UsersController < ApplicationController
    def index
        @users = User.all
          @users = User.left_joins(:messages)
               .select('users.*, COUNT(messages.id) AS messages_count')
               .group('users.id')
    end

    def show
        @user = User.find(params[:id])
        @chats = Chat.where("sender_id = ? OR receiver_id = ?", @user.id, @user.id)

    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to @user, notice: 'Usuario creado con exito'
        else
            render :new
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to @user, notice: "Usuario actualizado correctamente."
        else
            render :edit
        end
    end

    private

    def user_params
        params.require(:user).permit(:firstname, :lastname, :email)
    end
end
