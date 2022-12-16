class SignupController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(params_user)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Successfully created account"
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def params_user
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end