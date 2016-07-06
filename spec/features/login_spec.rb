require 'rails_helper'

describe 'Sign-in process', type: :feature do

  it 'should sing-in user on correct credentials' do
    visit new_user_session_path
  end
   
end