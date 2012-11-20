require "game-tictactoe-esegredo"

describe Tictactoe::DumbPlayer do
	before :each do
		@dp = Tictactoe::DumbPlayer.new("X")
	end

	it "Debe existir un metodo move" do
		@dp.respond_to?("move").should == true
	end
	
	it "Debe existir un metodo finish" do
		@dp.respond_to?("finish").should == true
	end

end
