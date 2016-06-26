class TodoController < ApplicationController
    before_action :authenticate_user!
    
    def index
        #Lists all current users todo lists
        @todos = current_user.todos
    end
    
end