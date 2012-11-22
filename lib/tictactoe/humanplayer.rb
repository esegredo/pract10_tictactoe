require "tictactoe/player"

module Tictactoe
  class HumanPlayer < Player
    def move( board )
      print board
      
      moves = board.moves
      print "Your move?  (format: b3)  "
      move = $stdin.gets
      until moves.include?(move.chomp.downcase)
        print "Invalid move.  Try again.  "
        move = $stdin.gets
      end
      move.chomp
    end
  end
end
