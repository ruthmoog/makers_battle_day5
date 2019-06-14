require 'sinatra/base'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    session[:player_1] = params[:player_1]
    session[:player_2] = params[:player_2]
    redirect to('/play')
  end

  get '/play' do
    @player_1 = session[:player_1]
    @player_2 = session[:player_2]
    erb(:play)
  end
  # this will start the server automatically if the app.rb file is run in the command line, ie `ruby app.rb`, so you don't have to start the server with eg `shotgun config.ru` :)
  run! if app_file == $0
end
