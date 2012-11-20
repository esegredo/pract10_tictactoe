# Game::Tictactoe::Esegredo

Gem which implements the Tic-Tac-Toe game with different
kind of players.

## Installation

Add this line to your application's Gemfile:

    gem 'game-tictactoe-esegredo'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install game-tictactoe-esegredo

## Usage

rake build    # Build tictactoe-0.0.1.gem into the pkg directory
rake doc      # Run rspec with --format documentation
rake dp_test  # Run DumbPlayer tests
rake dumb     # Run TicTacToe game vs dumb player
rake hp_test  # Run HumanPlayer tests
rake install  # Build and install tictactoe-0.0.1.gem into system gems
rake release  # Create tag v0.0.1 and build and push tictactoe-0.0.1.gem to Rubygems
rake smart    # Run TicTacToe game vs smart player
rake sp_test  # Run SmartPlayer tests
rake spec     # Run RSpec code examples

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
