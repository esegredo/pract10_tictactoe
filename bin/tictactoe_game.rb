require "game-tictactoe-esegredo"

if __FILE__ == $0
  if ARGV.size > 0 and ARGV[0] == "-d"
    game = Tictactoe::Game.new Tictactoe::HumanPlayer,
                   Tictactoe::DumbPlayer
  else
    game = Tictactoe::Game.new Tictactoe::HumanPlayer,
                   Tictactoe::SmartPlayer
  end
  game.play
end
