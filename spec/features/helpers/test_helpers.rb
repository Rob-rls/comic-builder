def create_comic
  visit '/'
  expect(page).to have_content('No comics added')
  click_link('Add Comic')
  fill_in('Title', with: 'The Farside')
  click_button('Save Comic')
end
