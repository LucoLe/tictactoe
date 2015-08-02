require 'tictactoe'
describe Game do
  let(:testBoard) { ["X", "X", "O", "-", "O", "-", "O", "-", "X"] }
  describe "initialize" do
    it "without arguments" do
      game = Game.new()
      expect(game.board).to eq(["-", "-", "-", "-", "-", "-", "-", "-", "-"])
    end

    it "with state array" do
      # testBoard = ["X", "X", "O", "-", "O", "-", "O", "-", "X"]
      game = Game.new(testBoard)
      expect(game.board).to eq(testBoard)
    end
  end

  describe "valid_move? method" do
    it "should return true when a move is possible" do
      game = Game.new()
      expect(game.valid_move?(1)).to eq(true)
    end

    it "should return false when a move is not possible" do
      game = Game.new(testBoard)
      expect(game.valid_move?(1)).to eq(false)
      expect(game.valid_move?(4)).to eq(false)
      expect(game.valid_move?("a5asdf")).to eq(false)
    end
  end
end