class Board
    attr_accessor :grid

    def initialize
        @grid = Array.new(3){Array.new(3, "_")}
        @eligible_marks = [:X, :O]
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []= (pos, mark)
        row, col = pos 
        @grid[row][col] = mark 
    end

    def occupied?(mark)
        @eligible_marks.include?(mark)
    end

    def all_spaces_used?
        @grid.all? {|row| row.all?{|mark| occupied?(mark)}}
    end

    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end
end