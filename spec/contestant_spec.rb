require 'rspec'
require './lib/game'
require './lib/contestant'
#iteration 1
RSpec.describe Contestant do 
  before(:each) do 
    @alexander = Contestant.new({first_name: 'Alexander',
      last_name: 'Aigiades',
      age: 28,
      state_of_residence: 'CO',
      spending_money: 10})
    @pick_4 = Game.new('Pick 4', 2)
    @mega_millions = Game.new('Mega Millions', 5, true)
  end

  it 'exists and has readable attributes' do 
    expect(@alexander).to be_instance_of(Contestant)
    expect(@alexander.full_name).to eq('Alexander Aigiades')
    expect(@alexander.age).to eq(28)
    expect(@alexander.state_of_residence).to eq('CO')
    expect(@alexander.spending_money).to eq(10)
  end

  it 'can determine if a resident is out of state' do 
    expect(@alexander.out_of_state?).to eq(false)
  end

  it 'shows interests of the contestant' do 
    expect(@alexander.game_interests).to eq([])

    @alexander.add_game_interest('Mega Millions')
    @alexander.add_game_interest('Pick 4')

    expect(@alexander.game_interests).to eq(['Mega Millions', 'Pick 4'])
    require 'pry'; binding.pry
  end
end