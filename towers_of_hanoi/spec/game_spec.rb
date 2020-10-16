require 'game'
require 'rspec'

describe Game do
    subject(:hanoi) { Game.new }
    describe "#initialize" do
        it "instantiates game instance correctly" do
            expect(hanoi.towers).to eq([[3,2,1],[],[]])
        end
    end

    describe "#get_move" do
        it "accepts input from user" do
            input = double("0 2\n", :chomp=>"0 2")
            allow(hanoi).to receive(:gets).and_return(input)
            expect(input).to receive(:chomp)
            expect(hanoi).to receive(:gets)
            hanoi.get_move
        end

        it "should return an array containing the player's two input numbers as integers" do
            input = double("0 2\n", :chomp=>"0 2")
            allow(hanoi).to receive(:gets).and_return(input)
            expect(hanoi.get_move).to eq([0,2])
        end

    end

    describe "#valid_move?" do
        it "checks if there is a disc at position chosen" do
            expect(hanoi.valid_move?([0,1])).to be_truthy
            expect(hanoi.valid_move?([1,0])).to be_falsey
        end

        it "checks moving disc is smaller than disc in new array" do
            hanoi.towers = [[3],[2],[1]]
            expect(hanoi.valid_move?([2,1])).to be_truthy
            expect(hanoi.valid_move?([0,1])).to be_falsey
        end
    end

    describe "#move" do
        it "takes off the top disc of pile selected" do
            hanoi.move([0,1])
            expect(hanoi.towers[0]).to eq([3,2])
        end

        it "adds disc to new pile" do
            hanoi.move([0,1])
            expect(hanoi.towers[1]).to eq([1])
        end
    end

    describe "#won?" do
        it "returns true if game is won and false if game is not won" do
            expect(hanoi.won?).to be_falsey
            hanoi.towers = [[],[],[3,2,1]]
            expect(hanoi.won?).to be_truthy
        end 
    end

    describe "#play" do
        it "calls get_move until game is won" do
            allow(hanoi).to receive(:get_move)
            # expect(hanoi).to receive(:get_move)
            hanoi.towers = [[],[],[3,2,1]]
            expect(hanoi.play).to eq("Game is won!")
        end
    end
end

