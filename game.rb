class TicTacToeGame
    require_relative 'player'

    def initialize(mark1, mark2, name1, name2)
        @mark1, @mark2 = mark1, mark2
        @player1 = Player.new(name1, mark1)
        @player2 = Player.new(name2, mark2)
    end


end