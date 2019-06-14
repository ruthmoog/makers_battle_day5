describe "enter player names and see them", type: :feature do
    it 'allows players to enter their names & displays their names' do
      visit '/'
      fill_in('player_1', with: 'Ruth')
      fill_in('player_2', with: 'Chris')
      click_button('Submit')
      expect(page).to have_content 'Ruth Vs Chris'
    end
end
