class ListsController < ApplicationController
    
  def index  
    @lists = current_user.lists.order(created_at: :desc)
    @new_list = Todo.new
  end
  
  def create
     @list = List.new(params.require(:todo).permit(:title).merge(user_id: current_user.id))
    respond_to do |format|
      if @list.save
        format.json { render json: @list, status: :created, location: @list }
        format.js { flash.now[:success] = "List created" }
      else
        format.html { render action: "new" }
        format.json { render json: @list.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

end
