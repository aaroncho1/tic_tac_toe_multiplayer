class TicTacToeGame
    require_relative 'player'

    attr_accessor :current_player

    def initialize(mark1, mark2, name1, name2)
        @mark1, @mark2 = mark1, mark2
        @player1 = Player.new(name1, mark1)
        @player2 = Player.new(name2, mark2)
        @current_player = @player1
        @board = Board.new
    end

    def game_over?


    def play
        puts "Let's play Tic Tac Toe! #{current_player.name} place your #{current_player.mark} by choosing a position in the format # # separated by a space:"
        until game_over?
            



end