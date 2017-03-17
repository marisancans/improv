class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: [:destroy, :edit, :update]
  before_action :current_user, only: [:create,:destroy, :edit, :update]
  
   
  def index  
    @lists = current_user.lists.includes(:list_items).order(created_at: :desc)
    @list = List.new
  end
  
  def create
    @list = current_user.lists.new(list_params)
      if @list.save
        respond_to do |format|
          format.js
        end        
      else
        @messages = @list.errors.full_messages
        @message_class = :error
        respond_to do |format|
          format.js { render 'shared/flash_now' }
        end  
      end
  end
  
  def destroy
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
  
  def edit
    respond_to do |format|
      format.js 
    end
  end
  
  def update
     respond_to do |format|
      if @list.update(list_params)
          format.json { render json: @list, status: :updated, location: @list }
          format.js { flash.now[:success] = "List #{@list.title} updated" }
      else
        format.json { render json: @list.errors, status: :unprocessable_entity }
        format.js { render :error }
      end
    end
  end
  
  def set_list
    @list = List.find(params[:id])
  end
  
  private
  
  def list_params
    params.require(:list).permit(:title, list_items_attributes: [:id, :content, :_destroy]).merge(user_id: current_user.id)
  end
  
  def correct_user
    redirect_to root_url unless @list.user_id == current_user.id
  end
  


end
