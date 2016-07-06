require 'rails_helper'

describe 'List page', type: :feature do
  before { login }
  it 'should show all lists' do
    visit root_url
  end
end