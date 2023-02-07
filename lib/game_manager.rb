require 'json'
require 'colorize'
require_relative 'board'
require_relative 'player'
class GameManager
	def load_board
		@board = Board.new.load_properties('board.json')
		puts "Game Manager Class: Better Play Fair!".blue
	end
	def load_players
		@players = Array.new
		file = File.read('players.json')
		file_data = JSON.parse(file)
		file_data.each do |name|
			@players << Player.new(name, self)
		end
	end
	def determine_game_from_roll(json)
		@results = Array.new
		file = File.read(json)
		file_data = JSON.parse(file)
		file_data.each do |num|
			@results << num
		end
	end
	def get_board
		@board
	end
	def get_property(index)
		@board[index]
	end
	def get_players
		@players
	end
	def get_dice_rolls
		@results
	end
	def after_game_report
		richest_player = get_players.max { |a, b| a.get_balance <=> b.get_balance }
		bankrupt_player = get_players.min { |a, b| a.get_balance <=> b.get_balance }
		puts "--- THE GAME HAS ENDED ---".light_blue
		puts " · What a close game!".light_blue
		puts " · Unfortunately, #{bankrupt_player.get_name} ran out of money!".light_blue
		get_players.each do |player|
			puts " · #{player.get_name}'s has a balance of $#{player.get_balance} and finished on #{player.get_current_property.get_name}".light_blue
		end
		puts " · Therefore, the winner of this game is #{richest_player.get_name}!".light_blue
		puts "--------------------------".light_blue
	end
end