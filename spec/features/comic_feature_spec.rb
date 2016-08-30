require 'rails_helper'

feature 'comic' do
  context 'when visiting the webpage with no comics' do
    scenario 'can add a comic' do
      visit '/'
      expect(page).to have_content('No comics added')
      click_link('Add Comic')
      fill_in('Title', with: 'The Farside')
      click_button('Save Comic')
      expect(page).to have_content('Title: The Farside')
      expect(page).not_to have_content('No comics added')
    end
  end
end
