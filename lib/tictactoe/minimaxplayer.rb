require "tictactoe/player"

module Tictactoe
  class MinimaxPlayer < Player
    def move( board )
      # Obtains the available movements
      moves = board.moves

      # For each available movement
      bestValue = -2
      bestMove = ""
      moves.each do |mov|
        newsquares = board.squares.dup
        newboard = Board.new(newsquares)
        newboard[mov] = self.mark
        value = search_best_move(newboard, opponent_mark, 1)
        if (value > bestValue)
          bestValue = value
          bestMove = mov
        end
      end
      bestMove
    end

    def search_best_move(board, mark, level)
			# Checks if there is a winner	
      return 1 if (board.won? == self.mark)
      return 0 if (board.won? == " ")
      return -1 if (board.won? == opponent_mark)
      
      # Gets the available movements
      moves = board.moves

      # Min level
      if ((level % 2 == 1) && (!board.won?))
        bestValue = 2
        moves.each do |mov|
          newsquares = board.squares.dup
          newboard = Board.new(newsquares)
          newboard[mov] = mark
          value = search_best_move(newboard, self.mark, level + 1)
          if (value < bestValue)
            bestValue = value
          end
        end
      # Max level
      elsif ((level % 2 == 0) && (!board.won?))
        bestValue = -2
        moves.each do |mov|
          newsquares = board.squares.dup
          newboard = Board.new(newsquares)
          newboard[mov] = mark
          value = search_best_move(newboard, opponent_mark, level + 1)
          if (value > bestValue)
            bestValue = value
          end
        end
      end
      bestValue
    end

    def opponent_mark
      if (self.mark == "X")
        return "O"
      else
        return "X"
      end
    end

  end
end
