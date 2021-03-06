require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign In')
      expect(page).to have_link('Sign Up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign Out')
    end
  end

  context "user signed in on the homepage" do
    before do
      visit('/')
      click_link('Sign Up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign Out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign In')
      expect(page).not_to have_link('Sign Up')
    end
  end

  context 'user is not logged in' do
    let!(:comic){ Comic.create(title: 'Cute Kittens') }
    let!(:comment){ comic.comments.create(text: "So Fluffy!") }

    scenario 'unsigned user cannot add a comic' do
      visit '/'
      click_link 'Add Comic'
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end

    scenario 'unsigned user cannot make changes to comics' do
      visit '/'
      click_link 'Cute Kittens'
      expect(page).to have_content 'Sign In'
      expect(page).not_to have_content 'Delete comic'
      expect(page).not_to have_content 'Update your comic'
      expect(page).not_to have_content 'Add A Comment'
      expect(page).not_to have_css 'a', text: 'Delete'
    end
  end
end
