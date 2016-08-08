class WelcomeController < ApplicationController
  before_action :authenticate_user! 
  def home
    @entries = current_user.entries.limit(20).order(published: :desc) #Or asc, have to check
  end  
end
