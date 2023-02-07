require 'game_manager'

describe GameManager do
  let(:game_manager) { GameManager.new }

  describe '#load_board' do
    it 'loads the properties from a JSON file into the board object' do
      game_manager.load_board('board.json')
      expect(game_manager.instance_variable_get(:@board)).to be_an_instance_of(Array)
    end
  end

  describe '#load_players' do
    it 'loads the players names from a JSON file into the players array' do
      game_manager.load_players('players.json')
      expect(game_manager.instance_variable_get(:@players)).to be_an_instance_of(Array)
      expect(game_manager.instance_variable_get(:@players).first).to be_an_instance_of(Player)
    end
  end

	describe '#determine_game_from_roll' do
    it 'loads the properties from a JSON file into the results array' do
      game_manager.determine_game_from_roll('rolls_1.json')
      expect(game_manager.instance_variable_get(:@results)).to be_an_instance_of(Array)
    end
  end

  describe '#get_board' do
    it 'returns the board object' do
      game_manager.load_board('board.json')
      expect(game_manager.get_board).to be_an_instance_of(Array)
    end
  end

  describe '#get_property' do
    it 'returns a property from the board based on the given index' do
      game_manager.load_board('board.json')
      expect(game_manager.get_property(0)).to be_an_instance_of(Property)
    end
  end

  describe '#get_players' do
    it 'returns the players array' do
      game_manager.load_players('players.json')
      expect(game_manager.get_players).to be_an_instance_of(Array)
    end
  end

  describe '#get_dice_rolls' do
    it 'returns the dice rolls results array' do
			game_manager.determine_game_from_roll('rolls_1.json')
      expect(game_manager.get_dice_rolls).to be_an_instance_of(Array)
    end
  end

	describe '#start_with_dice' do
    it 'returns after game report' do
			game_manager.start_with_dice('rolls_1.json')
      expect(game_manager.start_with_dice('rolls_1.json')).to be_an_instance_of(String)
    end
  end

end