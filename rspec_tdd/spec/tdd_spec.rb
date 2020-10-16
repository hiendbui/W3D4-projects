require "tdd"
require 'rspec'
require 'spec_helper'

describe "#my_uniq" do
    it "removes duplicate elements from given array" do
        expect(my_uniq([1,1,2])).to eq([1,2])
    end
end

describe Array do
    describe "#two_sum" do
        it "returns positions of pairs that add to 0" do
            expect([-1, 0, 2, -2].two_sum).to eq([[2, 3]])
        end

        it "returns correct positions of pairs in order" do
            expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
            expect([1, -1, -1].two_sum).to eq([[0, 1], [0, 2]])
        end
    end
end

describe "#my_transpose" do
    matrix = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
    ]
    transposed = [
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8]
    ]
    it "returns 2D Array" do
        expect(my_transpose(matrix).all?{|ele| ele.is_a?(Array)}).to be_truthy
    end

    it "returns array with original columns as rows" do
        expect(my_transpose(matrix)).to eq(transposed)
    end
end

describe "#stock_picker" do
    subject(:stocks) {stock_picker([2,0,5,1,7,9])}

    it "returns array with length of 2" do
        expect(stocks.length).to be(2)
    end

    it "first element of returned array should be best day to buy" do 
        expect(stocks[0]).to eq(1)
    end

    it "last element of returned array should be best day to sell" do
        expect(stocks[1]).to eq(5)
    end
end

