class Game

  attr_reader :active_player, :non_active_player, :last_victim_msg, :winner

  def self.create(player_1, player_2)
    @roger = Game.new(player_1, player_2)
  end

  def self.instance
    @roger
  end

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @active_player = player_1
    @non_active_player = player_2
    @last_victim_msg = ""
    @winner = nil
  end
  
  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def attack(player)
    player.damage

    # set the winner field when appropiate
    if player.hp == 0 
      @winner = @active_player
    end

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