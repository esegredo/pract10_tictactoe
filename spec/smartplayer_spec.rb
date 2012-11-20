require "game-tictactoe-esegredo"

describe Tictactoe::SmartPlayer do
	before :each do
		@sp = Tictactoe::SmartPlayer.new("X")
	end

	it "Debe existir un metodo move" do
		@sp.respond_to?("move").should == true
	end
	
	it "Debe existir un metodo finish" do
		@sp.respond_to?("finish").should == true
	end

end
