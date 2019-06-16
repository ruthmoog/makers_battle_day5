require 'player'

RSpec.describe Player do
  it "returns players' name" do
    player = Player.new("Ruth")
    expect(player.name).to eq("Ruth")
  end

  it "returns hitpoints" do
    player = Player.new("Ruth")
    expect(player.hp).to eq described_class::DEFAULT_HIT_POINTS
  end

  context "when attack" do
    it "reduces hitpoints by 10" do
      player_1 = Player.new("Ruth")
      player_2 = Player.new("Chris")
      expect { player_1.attack(player_2) }.to change{ player_2.hp }.from(60).to(50)
    end
  end
end
