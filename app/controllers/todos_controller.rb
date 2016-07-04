class TodosController < ApplicationController
  before_action :authenticate_user!
  
  def index
    #Passes all current user todo lists
    @todos = current_user.todos
    @new_todo = Todo.new
  end
  
  def new
    #Creates empty object from Todo class
    
  end
  
  def create
    @todo = Todo.new(params.require(:todo).permit(:title, :due_to).merge(user_id: current_user.id))
    respond_to do |format|
      if @todo.save
        format.json { render json: @todo, status: :created, location: @todo }
        format.js { flash.now[:success] = "Todo created" }
      else
        format.html { render action: "new" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end
  

  
end