require_relative 'game_manager'

# Create game
game = GameManager.new
game.load_board
game.load_players
game.determine_game_from_roll('rolls_1.json')

# Initialize index
current_roll = 0
current_player = 0

# Game Loop
while current_roll < game.get_dice_rolls.length do 
	# Get Current Roll
	roll = game.get_dice_rolls[current_roll]

	# Game Logic
	game.get_players[current_player].move_by(roll, game.get_board.length - 1)

	# Go to next player and next roll
	current_player = (current_player + 1) % game.get_players.length
	current_roll += 1
end