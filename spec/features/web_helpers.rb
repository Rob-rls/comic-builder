def create_comic
  visit '/'
  click_link('Add Comic')
  fill_in('Title', with: 'The Farside')
  click_button('Save Comic')
end

def create_strip
  fill_in "Name", with: "First Comic"
  page.attach_file "strip[image]", Rails.root + "spec/fixtures/kitty_2.jpeg"
  fill_in "Caption1", with: "first caption text"
  page.attach_file "strip[image2]", Rails.root + "spec/fixtures/kitty_3.jpg"
  fill_in "Caption2", with: "second caption text"
  page.attach_file "strip[image3]", Rails.root + "spec/fixtures/kitty_4.jpg"
  fill_in "Caption3", with: "third caption text"
  click_button "Create Strip"
end

def sign_up(email)
  visit('/')
  click_link('Sign Up')
  fill_in('Email', with: email)
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def sign_in(email:, password:)
  visit '/'
  click_link "Sign In"
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Sign In'
end
