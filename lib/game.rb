class Game

  attr_reader :active_player, :non_active_player, :last_victim_msg

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @active_player = player_1
    @non_active_player = player_2
    @last_victim_msg = ""
  end
  
  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def attack(player)
    player.damage

    @last_victim_msg = "#{@active_player.name} attacked #{@non_active_player.name}"
    
    if player == player_1
      @active_player = player_1
      @non_active_player = player_2
    end

    if player == player_2
      @active_player = player_2
      @non_active_player = player_1
    end

  end
end