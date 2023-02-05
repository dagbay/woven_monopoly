require 'json'
require_relative 'board'
require_relative 'player'
class GameManager
    def load_board
        @board = Board.new.load_properties('board.json')
        @board
    end
    def load_players
        @players = Array.new
        file = File.read('players.json')
        file_data = JSON.parse(file)
        file_data.each do |name|
            @players << Player.new(name)
        end
        @players
    end
end

game = GameManager.new
game.load_players