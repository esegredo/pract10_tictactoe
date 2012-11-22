require "game-tictactoe-esegredo"

describe Tictactoe::HumanPlayer do
	before :each do
		@hp = Tictactoe::HumanPlayer.new("X")
	end

	it "Debe existir un metodo move" do
		@hp.respond_to?("move").should == true
	end

end
