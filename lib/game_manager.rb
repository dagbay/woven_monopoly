require 'json'
require_relative 'board'
require_relative 'player'
class GameManager
	def load_board
		@board = Board.new.load_properties('board.json')
		puts "The board has been loaded!"
	end
	def load_players
		@players = Array.new
		file = File.read('players.json')
		file_data = JSON.parse(file)
		file_data.each do |name|
			@players << Player.new(name)
			puts "New Player: #{name} is now playing!"
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
	def get_players
		@players
	end
	def get_dice_rolls
		@results
	end
end