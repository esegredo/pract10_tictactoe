require "tictactoe/player"

module Tictactoe
  class SmartPlayer < Player
    def move( board )
      moves = board.moves
      
      # If I have a win, take it.  If he is threatening to win, stop it.
      board.each_row do |row|
        if row.blanks == 1 and (row.xs == 2 or row.os == 2)
          (0..2).each do |e|
            return row.to_board_name(e) if row[e] == " "
          end
        end
      end

      # Take the center if open.
      return "b2" if moves.include? "b2"

      # Defend opposite corners.
      if board[0] != @mark and board[0] != " " and board[8] == " "
        return "c3"
      elsif board[8] != @mark and board[8] != " " and board[0] == " "
        return "a1"
      elsif board[2] != @mark and board[2] != " " and board[6] == " "
        return "c1"
      elsif board[6] != @mark and board[6] != " " and board[2] == " "
        return "a3"
      end
      
      # Defend against the special case XOX on a diagonal.
      if board.xs == 2 and board.os == 1 and board[4] == "O" and
         (board[0] == "X" and board[8] == "X") or
         (board[2] == "X" and board[6] == "X")
        return %w{a2 b1 b3 c2}[rand(4)]
      end
      
      # Or make a random move.
      moves[rand(moves.size)]
    end
  end
end
