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
end