require "tictactoe/player"

module Tictactoe
  class DumbPlayer < Player
    def move( board )
      moves = board.moves
      moves[rand(moves.size)]
    end
  end 
end
