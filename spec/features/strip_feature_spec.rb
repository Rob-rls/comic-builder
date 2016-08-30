require 'rails_helper'

feature 'comic strip' do

  context 'new comic strip' do
    describe 'a user can create a new comic strip' do
      it 'creates a new comic with a name' do
        visit '/strips/new'
        expect(page).to have_content "Give your comic strip a name"
        fill_in "Name", with: "First Comic"
        click_button "Create Comic"
        expect(page).to have_content "First Comic"
        expect(page).to have_content "New comic strip successfully created"
      end
    end

    describe 'a user can edit an existing strip' do
      before do
        @strip = Strip.create(name: "First Comic")
      end
      it 'allows you to change the name' do
        visit "/strips/#{@strip.id}"
        expect(page).to have_content "First Comic"
        click_link "Edit Strip"
        fill_in "Name", with: "First Comic - version 2"
        click_button "Update Comic"
        expect(page).to have_content "First Comic - version 2"
        expect(page).to have_content "Comic strip was successfully updated"
      end
    end
    describe 'adding pictures' do
      before do
        @strip = Strip.create(name: "First Comic")
      end
      it 'can add the first photograph' do
        visit "/strips/#{@strip.id}"
        expect(page).to have_content "First Comic"
        click_link "Add image"
        page.attach_file "strip[image]", Rails.root + "spec/fixtures/kitty_1.jpeg"
        click_button "Post Photo"
        expect(page).to have_content "First Comic"
        expect(page).to have_content "Photo has been successfully added"
        expect(page).to have_xpath("//img[contains(@src,'kitty_1.jpeg')]")
      end
    end
  end

end
