# require_relative '../app'

describe "homepage", type: :feature do
  it 'displays message "Testing infrastructure working!"' do
    visit '/'
    page.should have_content 'Testing infrastructure working!'
  end
end
