module FeatureHelper
  def visit_homepage
    visit root_url
  end
  
  def login
    visit new_user_session_path
  end
end