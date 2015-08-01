require 'sinatra'

class TicTacToe < Sinatra::Base
  get '/' do
    erb :index
  end
end

TicTacToe.run! if __FILE__ == $0