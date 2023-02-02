require 'player'
RSpec.describe 'Player' do
    it 'creates a player instance' do
        player = Player.new('DummyUser')
        expect(player.get_name()).to eq('DummyUser')  
    end
end