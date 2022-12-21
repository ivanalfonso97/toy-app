class MainController < ApplicationController
    def index
        if Current.user 
            redirect_to toys_path
        end
    end
end