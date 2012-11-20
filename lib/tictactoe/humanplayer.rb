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
    
    def finish( final_board )
      print final_board
      
      if final_board.won? == @mark
        print "Congratulations, you win.\n\n"
      elsif final_board.won? == " "
        print "Tie game.\n\n"
      else
        print "You lost tic-tac-toe?!\n\n"
      end
    end
  end
end
