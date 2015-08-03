class Player

  attr_accessor :name, :marker
  def initialize(name, marker)
    @name = name
    @marker = marker
  end

end

class Game
  attr_accessor :board

  def initialize(board = Array.new(9) { |i| i = "-" })
    @board = board
  end

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