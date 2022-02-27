class TicTacToeGame
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
        puts "Let's play Tic Tac Toe! #{current_player.name}, place your #{current_player.mark} by choosing a position in the format # # separated by a space"
        until game_over?
            board.print
            mark = @current_player.mark
            pos = @current_player.choose_position
            board[pos] = mark
            switch_player
        end
    end
end

TicTacToeGame.new(:X, :Y, "Aaron", "Rhoza").play
