require 'rails_helper'

feature 'comment' do

  context 'visiting a comic page with no comments' do
    before do
      sign_up('test@example.com')
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

  context 'updating and deleting comments' do
    before do
      sign_up('test@example.com')
    end
    let!(:comic) { Comic.create(title: "The Farside") }
    let!(:comment) { comic.comments.create(text: 'Much far, very side') }
    scenario "a user can update a comment" do
      visit '/'
      click_link 'The Farside'
      expect(page).to have_content('Much far, very side')
      click_link 'Update Comment'
      fill_in 'Text', with: 'Much far, very side. Wow!'
      click_button 'Post'
      expect(page).to have_content 'Much far, very side. Wow!'
    end

    scenario 'deleting a posted comment' do
      visit '/'
      click_link 'The Farside'
      expect(page).to have_content('Much far, very side')
      click_link 'Delete'
      expect(page).not_to have_content 'Much far, very side'
    end
  end
end
