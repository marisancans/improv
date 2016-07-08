class ListsController < ApplicationController
  before_action :authenticate_user!
   
  def index  
    @lists = current_user.lists.includes(:list_items).order(created_at: :desc)
    @new_list = List.new
   # 2.times { @new_list.list_items.build}
  end
  
  def create
     @list = List.new(list_params)
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
  
  def destroy
    @list = List.find(params[:id])
    correct_user
    respond_to do |format|
      if @list.destroy
        format.json { render json: @list, status: :deleted, location: @list }
        format.js { flash.now[:success] = "List #{@list.title} deleted" }
      else
        format.json { render json: @list.errors, status: :unprocessable_entity }
        format.js { render :error }
      end
    end
  end
  
  private
  
  def list_params
    params.require(:list).permit(:title, list_items_attributes: [:id, :content, :_destroy]).merge(user_id: current_user.id)
  end
  
  def correct_user
    redirect_to root_url unless @list.user_id == current_user.id
  end

end
