class TodoController < ApplicationController
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
    @todo = Todo.new(params[:todo])

    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: 'Task was successfully created.' }
        format.json { render json: @todo, status: :created, location: @todo }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end
  
end