require 'game'

RSpec.describe Game do
  subject(:game) { described_class.new(player_1, player_2) }
  let(:player_1) { double :player_1 }
  let(:player_2) { double :player_2 }

  before(:each) do 
    allow(player_2).to receive(:hp)
    allow(player_2).to receive(:damage)
    allow(player_1).to receive(:hp)
    allow(player_1).to receive(:name)
    allow(player_2).to receive(:name)
  end

  describe "#player_1" do
    it "retrieves the first player" do
      expect(game.player_1).to eq(player_1)
    end
  end

  describe "#player_2" do
    it "retrieves the second player" do
      expect(game.player_2).to eq(player_2)
    end
  end

  describe "#attack" do

    it "damages the player" do
      allow(player_2).to receive(:hp)
      allow(player_2).to receive(:name) { "Apollo" }
      allow(player_1).to receive(:name) {"Pepper" }

      expect(player_2).to receive(:damage)
      game.attack(player_2)
    end

  end

  describe "#winner" do 
    it "puts the winner" do 
      allow(player_2).to receive(:hp) {0}
      game.attack(player_2)
      expect(game.winner).to eq(player_1)
    end
  end

  describe "#active_player" do
    it "has player_1 as first player" do 
      expect(game.active_player).to eq(player_1)
    end

    it "changes to player 2 after attack" do
      allow(player_2).to receive(:damage)
      allow(player_2).to receive(:name) { "Apollo" }
      allow(player_1).to receive(:name) {"Pepper" }

      game.attack(player_2)
      expect(game.active_player).to eq(player_2)
      expect(game.last_victim_msg).to eq("Pepper attacked Apollo")
    end

    it "changes to player 1 again after another attack" do
      allow(player_2).to receive(:damage)
      allow(player_2).to receive(:name) { "Apollo" }

      allow(player_1).to receive(:damage)
      allow(player_1).to receive(:name) {"Pepper" }

      game.attack(player_2)
      game.attack(player_1)

      expect(game.active_player).to eq(player_1)
    end
    
  end
end
