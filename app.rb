require 'sinatra'
require './lib/tictactoe.rb'
require 'rack-flash'

class TicTacToe < Sinatra::Base
  enable :sessions
  use Rack::Flash

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
    @game = Game.new
    erb :game
  end

  get '/game/:id' do
    @params = params
    @session = session
    @player1 = Player.new(1,session[:player1], "X")
    @player2 = Player.new(2,session[:player2], "O")
    @game = Game.new(session[:game_board])
    erb :game
  end
end

TicTacToe.run! if __FILE__ == $0