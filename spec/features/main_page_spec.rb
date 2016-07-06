require 'rails_helper'

describe 'Main page', type: :feature do

  it 'should have sign-out button' do
    visit root_url
    expect(page).to have_css('#logout-button')
  end
end