$:.unshift File.dirname(__FILE__) + 'lib'

require "bundler/gem_tasks"

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new
task :default => :spec

desc "Run TicTacToe game vs smart player"
task :smart do
	sh "ruby -Ilib bin/tictactoe_game.rb"
end

desc "Run TicTacToe game vs dumb player"
task :dumb do
	sh "ruby -Ilib bin/tictactoe_game.rb -d"
end

desc "Run rspec with --format documentation"
task :doc do
  sh "rspec -Ilib spec/*.rb --format documentation"
end

desc "Run HumanPlayer tests"
task :hp_test do
	sh "ruby -Ilib test/tc_humanplayer.rb"
end

desc "Run SmartPlayer tests"
task :sp_test do
	sh "ruby -Ilib test/tc_smartplayer.rb"
end

desc "Run DumbPlayer tests"
task :dp_test do
	sh "ruby -Ilib test/tc_dumbplayer.rb"
end
