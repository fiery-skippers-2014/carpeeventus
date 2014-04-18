require 'spec_helper'

feature "Viewing Events" do
   scenario "User can carpe eventus!", :js => true do
    visit '/'
    click_button('carpe eventus!')
    expect(page).to have_content 'carpe'
  end
end