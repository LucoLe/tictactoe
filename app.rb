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
    @current_marker = @player1.marker
    @player2 = Player.new(2,params[:player2], "O")
    @game = Game.new
    erb :game
  end

  get '/game/:id' do
    @player1 = Player.new(1,session[:player1], "X")
    @player2 = Player.new(2,session[:player2], "O")
    @game = Game.new(session[:game_board])
    if @game.valid_move?(params[:id].to_i)
      @game.place_marker(params[:id].to_i, session[:current_marker])
      @current_marker = session[:current_marker] == "X" ? "O" : "X"
      erb :game
    else
      @current_marker = session[:current_marker]
      erb :game
    end
  end
end

TicTacToe.run! if __FILE__ == $0