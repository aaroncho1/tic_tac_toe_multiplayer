class Board

    def initialize
        @grid = Array.new(3){Array.new(3, "_")}
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []= (pos, mark)
        row, col = pos 
        @grid[row][col] = mark 
    end

    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end




end