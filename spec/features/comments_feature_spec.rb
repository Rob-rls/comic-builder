require 'rails_helper'

feature 'comment' do



  context 'visiting a comic page with no comments' do
    before do
      create_comic
    end
    scenario 'can add a comment' do
      visit '/'
      click_link 'The Farside'
      expect(page).to have_content('Be the first to add a comment!')
      click_link 'Add A Comment'
      fill_in 'Text', with: 'Much far, very side'
      click_button 'Post'
      expect(page).to have_content 'Much far, very side'
    end
  end
end
