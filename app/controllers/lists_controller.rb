class ListsController < ApplicationController
  before_action :authenticate_user!
   
  def index  
    @lists = current_user.lists.order(created_at: :desc)
    @new_list = Todo.new
   # 2.times { @new_list.list_items.build}
  end
  
  def create
     @list = List.new(params.require(:todo).permit(:title).merge(user_id: current_user.id))
    respond_to do |format|
      if @list.save
        format.json { render json: @list, status: :created, location: @list }
        format.js { flash.now[:success] = "List #{@list.title} created" }
      else
        format.json { render json: @list.errors, status: :unprocessable_entity }
        format.js { render :error }
      end
    end
  end

end
