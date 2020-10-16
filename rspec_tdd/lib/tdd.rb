def my_uniq(arr)
    new_arr = []
    arr.each {|e| new_arr << e unless new_arr.include?(e)}
    new_arr
end

class Array
    def two_sum
        new_arr = []
        self.each_with_index do |ele1, i1|
            self.each_with_index do |ele2, i2|
                new_arr << [i1, i2] if ele1 + ele2 == 0 && i1 < i2
            end
        end
        new_arr
    end
end

def my_transpose(matrix)
    new_arr = Array.new(matrix[0].length) {Array.new}
    matrix.each do |row|
        row.each_with_index do |ele, idx|
            new_arr[idx] << ele
        end
    end
    new_arr
end

def stock_picker(arr)
    profit = 0
    days = []

    arr.each_with_index do |ele1, i1|
        arr.each_with_index do |ele2, i2|
            if i2 > i1 && ele2 - ele1 > profit
                profit = ele2 - ele1
                days = [i1, i2]
            end
        end
    end
    days
end