require 'rails_helper'

feature 'comic' do
  before do
    sign_up('test@example.com')
  end

    context 'when visiting the webpage with no comics' do
      scenario 'can add a comic' do
        visit '/'
        expect(page).to have_content('No comics added')
        click_link('Add Comic')
        fill_in('Title', with: 'The Farside')
        click_button('Save Comic')
        visit '/'
        expect(page).to have_content('Title: The Farside')
        expect(page).not_to have_content('No comics added')
      end

      scenario 'User can not enter an empty title' do
        visit '/'
        click_link('Add Comic')
        fill_in('Title', with: '')
        click_button('Save Comic')
        expect(current_path).to eq '/comics'
        expect(page).to have_content 'Don\'t be lazy, enter a title'
      end
    end

    context 'can view the comic page' do
      before do
        create_comic
      end

      scenario 'can see the comic' do
        visit '/'
        click_link('The Farside')
        expect(page).to have_content('The Farside')
        expect(page).to have_link('Add A Comment')
      end
    end

    context 'user can update/delete comics' do
      let!(:comic) { Comic.create(title: 'The Farside') }
      scenario 'user can update comics' do
        visit '/'
        click_link('The Farside')
        click_link('Update your comic')
        fill_in 'Title', with: 'Actually Monkeys Are Cooler'
        click_button 'Save Comic'
        expect(page).to have_content 'Actually Monkeys Are Cooler'
      end

      scenario 'user can delete comics' do
        visit '/'
        click_link 'The Farside'
        click_link 'Delete comic'
        expect(page).not_to have_content 'The Farside'
      end
    end

    context 'when viewing the index page' do
      before do
        create_comic
        create_strip
      end

      scenario 'can see a mini preview of the comic' do
        visit '/'
        expect(page).to have_xpath("//img[contains(@src,'kitty_2.jpeg')]")
      end
    end
end
