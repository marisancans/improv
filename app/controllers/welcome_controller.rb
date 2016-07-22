class WelcomeController < ApplicationController
  def home
    @entries = current_user.entries.limit(20).order(updated_at: :desc) #Or asc, have to check
  end  
end
