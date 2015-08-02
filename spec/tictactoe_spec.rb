require 'tictactoe'
describe Game do
  describe "initialize" do
    it "without arguments" do
      game = Game.new()
      expect(game.board).to eq(["-", "-", "-", "-", "-", "-", "-", "-", "-"])
    end

    it "with state array" do
      testBoard = ["X", "X", "O", "-", "O", "-", "O", "-", "X"]
      game = Game.new(testBoard)
      expect(game.board).to eq(testBoard)
    end
  end
end