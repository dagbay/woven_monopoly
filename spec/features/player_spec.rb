require 'player'

RSpec.describe Player do
	before do
		@player = Player.new('DummyUser')
	end
	describe 'initialized' do
		it 'should have a name' do
			expect(@player.get_name).to eq('DummyUser')
		end
		it 'should start with $16' do 
			expect(@player.get_balance).to eq(16)
		end
	end
end