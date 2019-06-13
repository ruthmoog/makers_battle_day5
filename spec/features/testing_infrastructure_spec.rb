# require_relative '../app'

describe "homepage", type: :feature do
  it 'displays message "Testing infrastructure working!"' do
    visit '/'
    page.should have_content 'Testing infrastructure working!'
  end
end

describe "enter player names and see them", type: :feature do
# fill in name in form
# submit the form
# see names on screen
    it 'allows players to enter their names & displays their names' do
      visit '/'
      fill_in('Name', with: 'Ruth')
      fill_in('Name', with: 'Chris')
      click_button('Submit')
      page.should have_content 'Ruth Vs Chris'
    end
end


