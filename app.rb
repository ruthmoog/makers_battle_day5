require 'sinatra/base'

class Battle < Sinatra::Base

  # get '/' do
  #   "Testing infrastructure working!"
  # end

  get '/' do
    @player_1 = params[:name_1]
    @player_2 = params[:name_2]
    erb(:index)
  end

  post '/names' do
    params[:name_1]
    params[:name_2]
    erb(:play)
  end


  # this will start the server automatically is the app.rb file is run in the command line, ie `ruby app.rb`, so you don't have to start the server with eg `shotgun config.ru` :)
  run! if app_file == $0
end
