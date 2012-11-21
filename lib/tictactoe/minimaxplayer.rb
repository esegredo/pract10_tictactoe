require "tictactoe/player"

module Tictactoe
  class MinimaxPlayer < Player
    def move( board )
      # Obtains the available movements
      moves = board.moves

      # For each available movement
      bestValue = -2
      bestMove = ""
      moves.each do |move|
        newsquares = board.squares.dup
        newboard = Board.new(newsquares)
        value = search_best_move(newboard, move, self.mark, 1)
        if (value >= bestValue)
          bestValue = value
          bestMove = move
        end
      end
      bestMove
    end

    def search_best_move(board, move, mark, level)
      # Puts the movement on the board
      board[move] = mark
      moves = board.moves

      # Checks whether there is a winner or not
      return 1 if (board.won? == self.mark)
      return 0 if (board.won? == " ")
      return -1 if (board.won? == opponent_mark)

      # Max level
      if ((level % 2 == 1) && (!board.won?))
        bestValue = -2;
        moves.each do |mov|
          newsquares = board.squares.dup
          newboard = Board.new(newsquares)
          value = search_best_move(newboard, mov, opponent_mark, level + 1)
          if (value >= bestValue)
            bestValue = value
          end
        end
      # Min level
      elsif ((level % 2 == 0) && (!board.won?))
        bestValue = 2;
        moves.each do |mov|
          newsquares = board.squares.dup
          newboard = Board.new(newsquares)
          value = search_best_move(newboard, mov, self.mark, level + 1)
          if (value <= bestValue)
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
