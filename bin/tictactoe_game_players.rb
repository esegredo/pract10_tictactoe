require "game-tictactoe-esegredo"

if __FILE__ == $0
  if (ARGV.size == 2)
		player1 = case ARGV[0].downcase
			when "smart" then Tictactoe::SmartPlayer
			when "minimax" then Tictactoe::MinimaxPlayer
			when "dumb" then Tictactoe::DumbPlayer
			when "human" then Tictactoe::HumanPlayer
			else Tictactoe::HumanPlayer
		end
		
		player2 = case ARGV[1].downcase
			when "smart" then Tictactoe::SmartPlayer
			when "minimax" then Tictactoe::MinimaxPlayer
			when "dumb" then Tictactoe::DumbPlayer
			when "human" then Tictactoe::HumanPlayer
			else Tictactoe::HumanPlayer
		end
		
    game = Tictactoe::Game.new(player1, player2, false)
  	game.play
	else
		puts "Usage: ruby -Ilib bin/tictactoe_game_players.rb player_x player_o"
	end
end
