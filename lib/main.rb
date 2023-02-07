require_relative 'game_manager'
require 'colorize'
require 'io/console'

# Create game
game = GameManager.new
game.load_board
game.load_players
game.determine_game_from_roll('rolls_1.json')

# Initialize variables
dice_rolls = game.get_dice_rolls
players = game.get_players
board = game.get_board
current_roll = 0
current_player = 0
continue = false

# Game Loop
while current_roll < dice_rolls.length do 
	# Get Current Roll
	roll = dice_rolls[current_roll]

	# Game Logic
	players[current_player].move_by(roll, board.length - 1)

    # Prompt for next turn or end of loop
    unless continue == true
        print "Press any key to continue or key \'Esc\' to go to the end of the loop: ".blue
        input_value = $stdin.getch
        continue = true if input_value == "\e"
    end

	# Go to next player and next roll
	current_player = (current_player + 1) % players.length
	current_roll += 1
end