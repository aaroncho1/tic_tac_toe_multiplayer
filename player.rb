class Player  

    def initialize(name, mark)
        @name, @mark = name, mark
    end

    def choose_position
        puts "Enter the position you would like to place your mark:"
        pos = gets.chomp.split(" ").map{|num| num.to_i}
    end

end
