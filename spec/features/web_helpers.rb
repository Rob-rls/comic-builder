def create_comic
  visit '/'
  click_link('Add Comic')
  fill_in('Title', with: 'The Farside')
  click_button('Save Comic')
end
