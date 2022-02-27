class Board

    def initialize
        @grid = Array.new(3){Array.new(3, "_")}
    end

    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end




end