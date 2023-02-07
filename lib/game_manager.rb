require 'json'
require 'io/console'

require_relative 'board'
require_relative 'player'

class GameManager

	def load_board(json)
		@board = Board.new.load_properties(json)
	end

	def load_players(json)
		@players = Array.new
		file = File.read(json)
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

	def start_with_dice(json)
		# Determine Game
		determine_game_from_roll(json)

		# Initialize board and players
		load_board('board.json')
		load_players('players.json')
		
		# Initialize variables
		dice_rolls = get_dice_rolls
		players = get_players
		board = get_board
		current_roll = 0
		current_player = 0
		continue = false

		# Game Loop
		while current_roll < dice_rolls.length do 
			# Get Current Roll
			roll = dice_rolls[current_roll]

			# Game Logic
			if players.any? { |player| player.bankrupt? }
				break
			end
			players[current_player].move_by(roll, board.length)

			# Go to next player and next roll
			current_player = (current_player + 1) % players.length
			current_roll += 1
		end
		after_game_report
	end

	def after_game_report
		richest_player = get_players.max { |a, b| a.get_balance <=> b.get_balance }
		bankrupt_player = get_players.min { |a, b| a.get_balance <=> b.get_balance }
		message = [
		  "--- THE GAME HAS ENDED ---",
		  " · What a close game!",
		  " · Unfortunately, #{bankrupt_player.get_name} ran out of money!",
		  *get_players.map { |player| " · #{player.get_name} has a balance of $#{player.get_balance} and finished on #{player.get_current_property.get_name}" },
		  " · Therefore, the winner of this game is #{richest_player.get_name}!",
		  "--------------------------\n"
		].join("\n")
		message
	end
end