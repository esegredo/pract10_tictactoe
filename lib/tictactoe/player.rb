module Tictactoe
  class Player
    def initialize( mark )
      @mark = mark # "X" or "O" or " "
    end
    
    attr_reader :mark
    
    def move( board )
      raise NotImplementedError, "Player subclasses must define move()."
    end

  end
end
