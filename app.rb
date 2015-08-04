require 'sinatra'
require './lib/tictactoe.rb'
require 'rack-flash'

class TicTacToe < Sinatra::Base
  enable :sessions
  use Rack::Flash

  # @method get_root
  # @overload get "/"
  # Gets the start page and sets the session to nil except for the
  # flash part
  get '/' do
    session[:winner] = nil
    session[:game_board] = nil
    session[:player1] = nil
    session[:player2] = nil
    session[:current_marker] = nil

    erb :index
  end

  # @method post_game
  # @overload post "/game"
  # Posts to the /game path. If there is a problem with the player names
  # the users will be redirected to the start page. Otherwise the game begins.
  post '/game' do
    if params[:player1] == '' || params[:player2] == ''
      flash[:danger] = "Please enter names for both players"
      redirect back
    end
    session[:winner] = nil
    session[:game_board] = nil
    @player1 = Player.new(params[:player1], "X")
    session[:player1] = @player1.name
    @current_marker = @player1.marker
    session[:current_marker] = @current_marker
    @player2 = Player.new(params[:player2], "O")
    session[:player2] = @player2.name
    @game = Game.new
    erb :game
  end

  # @method get_game
  # @overload get "/game/:id"
  # Gets to the page with the selected move. Here the controller checks if the
  # input is correct and checks if the game is finished.
  get '/game/:id' do
    @player1 = Player.new(session[:player1], "X")
    @player2 = Player.new(session[:player2], "O")
    @game = Game.new(session[:game_board])
    if @game.valid_move?(params[:id].to_i)
      @game.place_marker(params[:id].to_i, session[:current_marker])
      session[:winner] = @game.check_winner
      if session[:winner]
        redirect to('/gameover')
      else
        @current_marker = session[:current_marker] == "X" ? "O" : "X"
        erb :game
      end
    else
      @current_marker = session[:current_marker]
      erb :game
    end
  end

  # @method get_gameover
  # @overload get "/gameover"
  # Gets to the game over page where the result of the game is displayed and
  # there are two choices - either to the same opponents to play again or
  # a new game to start with new opponents.
  get '/gameover' do
    @player1 = Player.new(session[:player1], "X")
    @player2 = Player.new(session[:player2], "O")
    @game = Game.new(session[:game_board])
    @current_marker = session[:current_marker]
    erb :gameover
  end
end

TicTacToe.run! if __FILE__ == $0