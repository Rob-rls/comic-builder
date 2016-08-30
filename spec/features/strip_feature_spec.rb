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
  end

end
