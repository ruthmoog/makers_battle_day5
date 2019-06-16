describe "enter player names and see them", type: :feature do
    it 'allows players to enter their names & displays their names' do
      sign_in_and_play
      expect(page).to have_content 'Ruth Vs Chris'
    end

    it "should not show any victims" do
      sign_in_and_play
      expect(page).not_to have_content 'You attacked'
    end
end

describe "see player's hit points", type: :feature do
  it "allows each player to see hit points" do
    sign_in_and_play
    expect(page).to have_content "Chris: 60 hit points"
    expect(page).to have_content "Ruth: 60 hit points"
  end

  it "when p1 clicks attack it displays a confirmation" do
    sign_in_and_play
    click_button('attack')
    expect(page).to have_content "Ruth attacked Chris"
  end

  it "when p2 clicks attack it displays a confirmation" do
    sign_in_and_play
    click_button('attack')
    click_button('attack')
    expect(page).to have_content "Chris attacked Ruth"
  end

  it "when p1 clicks attack it reduces p2 HP by 10" do
    sign_in_and_play
    # expect(page).to have_content "Chris: 60 hit points"
    click_button('attack')
    expect(page).to have_content "Chris: 50 hit points"
  end

  it "shows who's turn it is" do 
    sign_in_and_play
    expect(page).to have_content "Ruth's turn"
  end

  it "changes turns after an attack" do 
    sign_in_and_play
    click_button('attack')
    expect(page).to have_content "Chris's turn"
  end


end
