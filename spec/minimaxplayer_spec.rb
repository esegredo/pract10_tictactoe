require "game-tictactoe-esegredo"

describe Tictactoe::MinimaxPlayer do
	before :each do
		@mp = Tictactoe::MinimaxPlayer.new("X")
	end

	it "Debe existir un metodo move" do
		@mp.respond_to?("move").should == true
	end
	
	it "Debe existir un metodo finish" do
		@mp.respond_to?("finish").should == true
	end

	it "El metodo move debe tratar de evitar la derrota" do
		@board = Tictactoe::Board.new(["X", "X", "O", "O", "O", "X", " ", "O", " "])
		@mp.move(@board).should == "c1"
  end
	
	it "El metodo move debe tratar de ganar" do
		@board = Tictactoe::Board.new([" ", "O", "X", " ", "X", " ", "O", "O", "X"])
		@mp.move(@board).should == "a1"
  end
end
