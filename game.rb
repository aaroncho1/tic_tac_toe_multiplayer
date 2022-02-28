class TicTacToeGame
    # require 'byebug'
    require_relative 'player'
    require_relative 'board'

    attr_accessor :current_player
    attr_reader :board

    def initialize(mark1, mark2, name1, name2)
        @mark1, @mark2 = mark1, mark2
        @player1 = Player.new(name1, mark1)
        @player2 = Player.new(name2, mark2)
        @current_player = @player1
        @board = Board.new
    end

    def game_over?
        @board.all_spaces_used?
    end

    def switch_player
        @current_player = @current_player == @player1 ? @player2 : @player1
        puts "#{@current_player.name}'s turn."
    end

    def check_errors(pos)
        mark = board[pos]
        raise "The position is already marked. Please try again" if board.occupied?(mark)
        pos.each do |num|
            raise "You must choose a number between 0 and 2. Please try again" if !num.between?(0,2)
        end
    end

    def play
        # debugger
        puts "Let's play Tic Tac Toe! #{current_player.name}, place your #{current_player.mark} by choosing a position in the format # # separated by a space"
        loop do
            board.print
            mark = @current_player.mark
            begin
                pos = @current_player.choose_position
                check_errors(pos)
            rescue => e  
                puts e.message   
                retry 
            end
            board[pos] = mark
            break if winner
            break if game_over?
            switch_player
        end
        game_over_message
    end

    def game_over_message
        if winner
            puts "Game over. #{winner} wins!"
        else
            puts "It's a draw!"
        end
        board.print
    end

    def winner
        board.grid.each do |row| 
            return @current_player.name if row.all?{|mark| mark == @current_player.mark}
        end

        board.grid.transpose.each do |col|
            return @current_player.name if col.all?{|mark| mark == @current_player.mark}
        end

        if (0...board.grid.length).all? {|i| board.grid[i][i] == @current_player.mark}
            return @current_player.name
        elsif (0...board.grid.length).all? do |i|
            row = i  
            col = board.grid.length - 1 - i  
            (board.[]([row, col])) == @current_player.mark
            end
            return @current_player.name
        end
        
        false
    end

end

TicTacToeGame.new(:X, :O, "Aaron", "Rhoza").play
