class Game
    attr_accessor :towers

    def initialize
        @towers = [[3,2,1],[],[]]
    end

    def get_move
        p "what tower do you want to take from, and where do you want to put it?"
        input = gets.chomp
        move = [input[0].to_i, input[2].to_i]
        move
    end

    def valid_move?(arr)
        pile1 = towers[arr[0]]
        pile2 = towers[arr[1]]
        if pile1.length >= 1
            if pile2.empty? || pile1[-1] < pile2[-1]
                return true
            end
        end
        false
    end

    def move(arr)
        pile1 = towers[arr[0]]
        pile2 = towers[arr[1]]
        pile2 << pile1.pop
    end

    def won?
        towers == [[],[],[3,2,1]]
    end

    def play
        until won?
            p towers
            turn = get_move
            move(turn) if valid_move?(turn)
        end
        p towers
        p "Game is won!"
    end
end

g = Game.new
g.play