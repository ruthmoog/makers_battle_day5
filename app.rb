require 'sinatra/base'

class Battle < Sinatra::Base

  get '/' do
    'Hello BATTLE!'
  end

  # this will start the server automatically is the app.rb file is run in the command line, ie `ruby app.rb`, so you don't have to start the server with eg `shotgun config.ru` :)
  run! if app_file == $0
end
