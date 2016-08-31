require 'rails_helper'
require_relative 'web_helpers'

feature 'Strip' do

  context "After creating a new comic" do
      scenario "user is ceating a new strip" do
        create_comic
        expect(page).to have_content "Give your comic strip a name"
        fill_in "Name", with: "First Comic"
        click_button "Create Strip"
        expect(page).to have_content "First Comic"
        expect(page).to have_content "New comic strip successfully created"
      end

      scenario 'user is editing strip name' do
        create_comic
        fill_in "Name", with: "First Comic"
        click_button "Create Strip"
        click_link "Edit Strip"
        fill_in "Name", with: "First Comic - version 2"
        click_button "Update Strip"
        expect(page).to have_content "First Comic - version 2"
        expect(page).to have_content "Comic strip was successfully updated"
      end

      scenario 'user is adding a picture to the strip' do
        create_comic
        fill_in "Name", with: "First Comic"
        click_button "Create Strip"
        click_link "Edit Strip"
        page.attach_file "strip[image]", Rails.root + "spec/fixtures/kitty_2.jpeg"
        click_button "Update Strip"
        expect(page).to have_content "First Comic"
        expect(page).to have_xpath("//img[contains(@src,'kitty_2.jpeg')]")
      end
  end

end
