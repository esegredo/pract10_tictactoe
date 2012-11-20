require "game-tictactoe-esegredo"
require "test/unit"

class TestSmartPlayer < Test::Unit::TestCase
	def setup
		@sp = Tictactoe::SmartPlayer.new("X")
	end

	def test_implements_move
		assert_equal true, @sp.respond_to?("move")
	end
	
	def test_implements_finish
		assert_equal true, @sp.respond_to?("finish")
	end
end
