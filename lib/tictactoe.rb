class Player

  attr_accessor :id, :name, :marker
  def initialize(id, name, marker)
    @id = id
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
end