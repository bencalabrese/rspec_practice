require 'my_array'

describe Array do
  describe "#my_uniq"  do
    it "returns an empty array when input is empty" do
      array = []
      expect(array.my_uniq).to eq([])
    end

    it "returns the original array when there are no dups" do
      array = [1,2,3,4,5]
      expect(array.my_uniq).to eq([1,2,3,4,5])
    end

    it "returns uniq array when there are dups" do
      array = [1,2,1,3,2,5]
      expect(array.my_uniq).to eq([1,2,3,5])
    end

    it "returns uniq array when there are > 2 copies of the same el" do
      array = [1,1,1,2]
      expect(array.my_uniq).to eq([1,2])
    end
  end

  describe "#two_sum" do
    context "with no two-sum pairs" do
      it "returns an empty array" do
        array = [1,2,3,4]
        expect(array.two_sum).to eq([])
      end
    end

    context "with two-sum pairs" do
      let(:array) {[-1, 2, 1, -2, 0]}

      it "does not return transposed results" do
        expect(array.two_sum).not_to include([3,1], [2,0])
      end

      it "returns all pairs" do
        expect(array.two_sum).to include([0,2], [1,3])
      end

      it "returns results in order" do
        expect(array.two_sum).to eq([[0,2], [1,3]])
      end

      it "does not return spurious results" do
        expect(array.two_sum).not_to include([4,4])
      end
    end
  end

  describe "#my_transpose" do
    it "transposes an empty array" do
      array = []
      expect(array.my_transpose).to eq(array.transpose)
    end

    it "transposes a single entry array" do
      array = [[1]]
      expect(array.my_transpose).to eq(array.transpose)
    end

    it "transposes a single row array" do
      array = [[1,2,3]]
      expect(array.my_transpose).to eq(array.transpose)
    end

    it "transposes a two dimensional array" do
      array = [[0, 1, 2],
               [3, 4, 5],
               [6, 7, 8]]
      # TODO add transposed array variable

      expect(array.my_transpose).to eq(array.transpose)
    end

    it "raises an error for non-nested arrays" do
      array = [1,2]
      expect { array.my_transpose }.to raise_error(TypeError)
    end

    it "raises an error if element sizes differ" do
      array = [[1,2,3], [4,5]]
      expect { array.my_transpose }.to raise_error(IndexError)
    end
  end

  describe "#stock_picker" do
    context "when profit is not available" do
      it "returns nil for an empty array" do
        stocks = []
        expect(stocks.stock_picker).to eq(nil)
      end

      it "returns nil for single element array" do
        stocks = [1]
        expect(stocks.stock_picker).to eq(nil)
      end

      it "returns nil unless profit is > 0" do
        stocks = [20, 2]
        expect(stocks.stock_picker).to eq(nil)
      end
    end

    context "when profit is available" do
      let(:stocks) {[11,3,2,5,20,0,10,1]}

      it "returns a set of indices" do
        expect(stocks.stock_picker).to be_an_instance_of(Array)
        expect(stocks.stock_picker.length).to eq(2)
      end

      it "returns the correct indices" do
        expect(stocks.stock_picker).to eq([2,4])
      end
    end
  end

end
