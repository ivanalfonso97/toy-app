class ToysController < ApplicationController
    before_action :require_user_logged_in!
    before_action :set_toy, only: [:edit, :update, :destroy]

    def index
        @toys = Toy.all
    end

    def dashboard
        @toys = Current.user.toys
    end

    def new
        @toy = Toy.new
    end

    def create
        @toy = Current.user.toys.new(params_toy)
        @toy.image.attach(params[:toy][:image])
        if @toy.save
            redirect_to toys_path, notice: "Toy has been listed"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @toy.update(params_toy)
            redirect_to toys_path, notice: "Toy has been updated successfully"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @toy.destroy
        redirect_to toys_path, notice: "Toy was removed from your list"
    end

    private

    def params_toy
        params.require(:toy).permit(:toy_name, :category, :description, images: [])
    end

    def set_toy
        @toy = Current.user.toys.find(params[:id])
    end
end