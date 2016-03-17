require 'towers'

describe Towers do
  subject(:towers) { Towers.new }

  describe "#new" do
    it "returns a valid grid" do
      starting_grid = [[3,2,1],[],[]]
      expect(towers.grid).to eq(starting_grid)
    end
  end

  describe "#move" do
    let(:mock_grid) {[[3,2], [1], []]}
    before(:each) do
      towers.stub(:grid) { mock_grid }
    end

    it "processes a valid move" do
      towers.move(0,2)
      expect(mock_grid).to eq([[3],[1],[2]])
    end

    it "rejects invalid moves" do
      expect { towers.move(0,1) }.to raise_error("illegal move")
    end

    it "rejects moves from empty positions" do
      expect { towers.move(2,1) }.to raise_error("no disk at that position")
    end

    it "rejects moves with off-board coordinates" do
      expect{ towers.move(4,1)}.to raise_error("off board")
    end
  end

  describe "#won?" do
    it "returns false if non-winning grid" do
      expect(towers.won?).to be false
    end

    it "returns true for win condition 1" do
      mock_grid = [[], [3,2,1], []]
      towers.stub(:grid) { mock_grid }
      expect(towers.won?).to be true
    end

    it "returns true for win condition 2" do
      mock_grid = [[], [], [3,2,1]]
      towers.stub(:grid) { mock_grid }
      expect(towers.won?).to be true
    end
  end

  # describe "#play" do
  #
  # end
end
