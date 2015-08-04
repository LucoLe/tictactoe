# The player object stores the name and the marker of the player
class Player

  attr_accessor :name, :marker
  # @param [String, String] Takes the name and the marker (either "X" or "O").
  def initialize(name, marker)
    @name = name
    @marker = marker
  end

end

  # TODO - all the methods convert the cell number from 1 based array to 0 based array. Probably the board should be a hash with number keys and then the methods should be rewritten to work with the actual value provided.
class Game
  attr_accessor :board

  # @param [optional Array] Creates a new empty board when no parameter is
  # provided. When an array with the current state is given then the board
  # variable stores that state.
  def initialize(board = Array.new(9) { |i| i = "-" })
    @board = board
  end

  # Checks if the move is possible.
  # @param [Integer] The cell number. The first cell is 1
  def valid_move?(cell_nr)
    if cell_nr.to_i.between?(1,9) && (@board[cell_nr - 1] == "-")
      true
    else
      false
    end
  end

  def place_marker(cell_nr, marker)
    @board[cell_nr - 1] = marker
  end

  # Checks the array for a winning combination of cells.
  #
  # @return [nil or Array] if there is no winning combination it returns nil,
  # if it finds a winning combo it returns an array with cell numbers of the
  # combo in 1 based array.
  def winner_combination
    combination = nil
    # Check rows
    (0..8).step(3) do |i|
      if @board[i] != "-" && @board[i] == @board[i+1] && @board[i] == @board[i+2]
        return combination = [i+1, i+2, i+3]
      end
    end

    # Check columns
    (0..2).each do |i|
      if @board[i] != "-" && @board[i] == @board[i+3] && @board[i] == @board[i+6]
        return combination = [i+1, i+4, i+7]
      end
    end

    # Check top left - bottom right diag
    if @board[0] != "-" && @board[0] == @board[4] && @board[0] == @board[8]
      return combination = [1, 5, 9]
    end

    # Check top right - bottom left diag
    if @board[2] != "-" && @board[2] == @board[4] && @board[2] == @board[6]
      return combination = [3, 5, 7]
    end
  end

  # Checks if the game is still in progress, if it is a draw or if there is a
  # winner.
  #
  # @return [nil or Array] if the game is still in progress it returns nil. If
  # the game is a draw it returns an array with "draw" (the output has to be
  # an array it can't be only a string). If there is a winner the method
  # returns the winning combination.
  def check_winner
    winner = nil
    if !winner_combination && !@board.include?("-")
      winner = ["draw"]
    elsif winner_combination
      winner = winner_combination
    end
    winner
  end
end