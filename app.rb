require 'sinatra/base'
require './lib/player.rb'
require './lib/game.rb'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    player_1 = Player.new(params[:player_1])
    player_2 = Player.new(params[:player_2])
    $game = Game.new(player_1, player_2)
    redirect to('/play')
  end

  get '/play' do
    @game = $game
    erb(:play)
  end

  post '/attack' do
    $game.attack($game.non_active_player)
    redirect to('play')
  end

  # this will start the server automatically if the app.rb file is run in the command line, ie `ruby app.rb`, so you don't have to start the server with eg `shotgun config.ru` :)
  run! if app_file == $0
end
