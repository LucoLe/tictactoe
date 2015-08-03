require 'tictactoe'
describe Game do
  let(:emptyBoard) { ["-", "-", "-", "-", "-", "-", "-", "-", "-"] }
  let(:testBoard) { ["X", "X", "O", "-", "O", "-", "X", "-", "O"] }
  let(:draw) { ["X", "O", "X", "X", "O", "O", "O", "X", "X"] }
  let(:middle_row) { ["O", "-", "O", "X", "X", "X", "-", "-", "-"] }
  let(:last_col) { ["O", "-", "X", "-", "-", "X", "O", "-", "X"] }
  let(:top_left_bottom_right) { ["O", "-", "X", "O", "X", "-", "X", "-", "-"] }
  let(:top_right_bottom_left) { ["X", "-", "O", "O", "X", "-", "-", "-", "X"] }

  describe "initialize" do
    it "without arguments" do
      game = Game.new()
      expect(game.board).to eq(emptyBoard)
    end

    it "with state array" do
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
      expect(game.valid_move?(5)).to eq(false)
      expect(game.valid_move?("a5asdf")).to eq(false)
    end
  end

  describe "win position" do
    it "should be nil and game still in progress" do
      game = Game.new(testBoard)
      expect(game.winner_combination).to eq(nil)
      expect(game.check_winner).to eq(nil)
    end

    it "should be draw" do
      game = Game.new(draw)
      expect(game.winner_combination).to eq(nil)
      expect(game.check_winner).to eq("draw")
    end

    it "should be middle row" do
      game = Game.new(middle_row)
      expect(game.winner_combination).to eq([4, 5, 6])
      expect(game.check_winner).to eq([4, 5, 6])
    end

    it "should be last column" do
      game = Game.new(last_col)
      expect(game.winner_combination).to eq([3, 6, 9])
      expect(game.check_winner).to eq([3, 6, 9])
    end

    it "should be top left bottom right diagonal" do
      game = Game.new(top_left_bottom_right)
      expect(game.winner_combination).to eq([3, 5, 7])
      expect(game.check_winner).to eq([3, 5, 7])
    end

    it "should be top right bottom left diagonal" do
      game = Game.new(top_right_bottom_left)
      expect(game.winner_combination).to eq([1, 5, 9])
      expect(game.check_winner).to eq([1, 5, 9])
    end
  end
end