module Tictactoe
  module SquaresContainer
    def []( index ) @squares[index] end

    def blanks()  @squares.find_all { |s| s == " " }.size end
    def os()      @squares.find_all { |s| s == "O" }.size end
    def xs()      @squares.find_all { |s| s == "X" }.size end
  end
  
  class Board
    class Row
      def initialize( squares, names )
        @squares  = squares
        @names    = names
      end
      
      include SquaresContainer
      
      def to_board_name( index ) 
        Board.index_to_name(@names[index]) 
      end
    end
    
    MOVES = %w{a1    a2   a3   b1   b2   b3   c1   c2   c3}
    # Define constant INDICES
    INDICES = Hash.new { |h, k| h[k] = MOVES.find_index(k) }

    def self.name_to_index( name )# Receives "b2" and returns 4
      INDICES[name]
    end
    
    def self.index_to_name( index ) # Receives the index, like 4 and returns "b2"
      MOVES[index]
    end
    
    def initialize( squares )
      @squares = squares # An array of Strings: [ " ", " ", " ", " ", "X", " ", " ", " ", "O"]
    end
      
    include SquaresContainer
    
    def []( *indices )
      if indices.size == 2                  # board[1,2] is @squares[7]
        super indices[0] + indices[1] * 3   # calls SquaresContainer [] method
      elsif indices[0].is_a? Fixnum         # board[7]
        super indices[0]
      else                                  # board["b2"]
        super Board.name_to_index(indices[0].to_s)
      end
    end

    def []=(indice, value)                  # board["b2"] = "X"
      m = Board.name_to_index(indice)
      @squares[m] = value
    end
    
    HORIZONTALS = [ [0, 1, 2], [3, 4, 5], [6, 7, 8] ]
    COLUMNS     = [ [0, 3, 6], [1, 4, 7], [2, 5, 8] ]
    DIAGONALS   = [ [0, 4, 8], [2, 4, 6] ]
    ROWS = HORIZONTALS + COLUMNS + DIAGONALS

    def each_row
      ROWS.each do |e|
        yield Row.new(@squares.values_at(*e), e)
      end
    end
    
    def moves
      moves = [ ]
      @squares.each_with_index do |s, i|
        moves << Board.index_to_name(i) if s == " "
      end
      moves # returns the set of feasible moves [ "b3", "c2", ... ]
    end
    
    def won?
      each_row do |row|
        return "X" if row.xs == 3 # "X" wins
        return "O" if row.os == 3 # "O" wins
      end
      return " " if blanks == 0   # tie
      false
    end
    
    BOARD =<<EOS

  +---+---+---+
a | 0 | 1 | 2 |
  +---+---+---+
b | 3 | 4 | 5 |
  +---+---+---+
c | 6 | 7 | 8 |
  +---+---+---+
    1   2   3

EOS
    def to_s
      BOARD.gsub(/(\d)(?= \|)/) { |i| @squares[i.to_i] }
    end

  end
end


