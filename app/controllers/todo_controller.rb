class TodoController < ApplicationController
  before_action :authenticate_user!
  
  def index
    #Passes all current user todo lists
    @todos = current_user.todos
  end
  
  def new
    #Creates empty object from Todo class
    @todo = Todo.new
    #Responds with js rendering _form.html to user when he clicks "New todo list" button
  end
  
end