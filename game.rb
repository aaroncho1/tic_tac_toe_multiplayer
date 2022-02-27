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
        @board.all_spaces_used
    end

    def switch_player
        @current_player = @current_player == @player1 ? @player2 : @player1
        puts "#{@current_player.name}'s turn."
    end

    def play
        # debugger
        puts "Let's play Tic Tac Toe! #{current_player.name}, place your #{current_player.mark} by choosing a position in the format # # separated by a space"
        until game_over?
            board.print
            mark = @current_player.mark
            pos = @current_player.choose_position
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
            if row.all?{|mark| mark == :X}
                return @player1.name
            elsif row.all?{|mark| mark == :O}
                return @player2.name
            end
        end

        board.grid.transpose.each do |col|
            if col.all?{|mark| mark == :X}
                return @player1.name 
            elsif col.all?{|mark| mark == :O}
                return @player2.name
            end
        end
        false
    end

end

TicTacToeGame.new(:X, :O, "Aaron", "Rhoza").play
