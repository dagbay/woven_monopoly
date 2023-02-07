require_relative 'game_manager'

# Create game
game = GameManager.new
puts "Game Number 1:"
game.start_with_dice('rolls_1.json')
puts "Game Number 2:"
game.start_with_dice('rolls_2.json')