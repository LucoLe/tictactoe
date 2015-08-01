require 'sinatra'
require './lib/tictactoe.rb'

class TicTacToe < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/game' do
    if params[:player1] == '' || params[:player2] == ''
      flash[:danger] = "Please enter names for both players"
      redirect back
    end
    @player1 = Player.new(1,params[:player1], "X")
    @player2 = Player.new(2,params[:player2], "O")
    erb :game
  end
end

TicTacToe.run! if __FILE__ == $0