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
        newboard = Board.new(board.squares)
        value = search_best_move(newboard, move, self.mark, 1)
        if (value > bestValue)
          bestValue = value
          bestMove = move
        end
      end
      bestMove
    end

    def opponent_mark
      if (self.mark == "X")
        return "O"
      else
        return "X"
      end
    end

    def search_best_move(board, move, mark, level)

      # Puts the movement on the board
      board[move] = mark
      moves = board.moves

      # Max level
      if (level % 2 == 1)
        return 1 if (board.won? == mark)
        return 0 if (board.won? == " ")
        return -1 if (board.won? == opponent_mark)
        if (!board.won?)
          bestValue = -2;
          moves.each do |mov|
            newboard = Board.new(board.squares)
            value = search_best_move(newboard, mov, opponent_mark, level + 1)
            if (value > bestValue)
              bestValue = value
            end
          end
          return bestValue
        end
      # Min level
      elsif (level % 2 == 0)
        return -1 if (board.won? == opponent_mark)
        return 0 if (board.won? == " ")
        return 1 if (board.won? == self.mark)
        if (!board.won?)
          bestValue = 2;
          moves.each do |mov|
            newboard = Board.new(board.squares)
            value = search_best_move(newboard, mov, self.mark, level + 1)
            if (value < bestValue)
              bestValue = value
            end
          end
          return bestValue
        end
      end
    end
  end
end
