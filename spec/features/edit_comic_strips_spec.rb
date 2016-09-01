require 'rails_helper'
require_relative 'web_helpers'

feature 'Editing Comic' do

  context "After creating a new comic" do
    before do
      sign_up('test@example.com')
      create_comic
      create_strip
    end

    scenario "user is editing his comic" do
      visit "/"
      click_link "The Farside"
      click_link "Update your comic"
      expect(page).to have_xpath("//img[contains(@src,'kitty_2.jpeg')]")
    end
  end
end
