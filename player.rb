class Player  
    attr_accessor :name, :mark

    def initialize(name, mark)
        @name, @mark = name, mark
    end

    def choose_position
        puts "Enter the position you would like to place your mark (#{mark}):"
        pos = gets.chomp.split(" ").map{|num| num.to_i}
        check_errors(pos)
        pos
    end

    def check_errors(pos)
        pos.each do |num|
            if !num.between?(0,2)
                raise "Invalid position number. Make sure number is between 0 and 2"
            end
        end
    end


end
