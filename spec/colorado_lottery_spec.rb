require 'rspec'
require './lib/game'
require './lib/contestant'
require './lib/colorado_lottery'

RSpec.describe ColoradoLottery do 
  before(:each) do 
    @lottery = ColoradoLottery.new
    @alexander = Contestant.new({first_name: 'Alexander',
      last_name: 'Aigiades',
      age: 28,
      state_of_residence: 'CO',
      spending_money: 10})
    @pick_4 = Game.new('Pick 4', 2)
    @mega_millions = Game.new('Mega Millions', 5, true)
    @cash_5 = Game.new('Cash 5', 1)
    @benjamin = Contestant.new({
      first_name: 'Benjamin',
      last_name: 'Franklin',
      age: 17,
      state_of_residence: 'PA',
      spending_money: 100})
    @frederick = Contestant.new({
      first_name:  'Frederick',
      last_name: 'Douglass',
      age: 55,
      state_of_residence: 'NY',
      spending_money: 20})
    @winston = Contestant.new({
      first_name: 'Winston',
      last_name: 'Churchill',
      age: 18,
      state_of_residence: 'CO',
      spending_money: 5})
      @alexander.add_game_interest('Pick 4')
      @alexander.add_game_interest('Mega Millions')
      @frederick.add_game_interest('Mega Millions')
      @winston.add_game_interest('Cash 5')
      @winston.add_game_interest('Mega Millions')
      @benjamin.add_game_interest('Mega Millions')
    end

  it 'exists' do 
    expect(@lottery).to be_instance_of(ColoradoLottery)
  end

  it 'can register contestants' do 
    expect(@lottery.registered_contestants).to eq({})
  end

  it 'can list winners' do 
    expect(@lottery.winners).to eq([])
  end

  it 'can add interests to contestants and confirm age' do 
    expect(@lottery.interested_and_18?(@alexander, @pick_4)).to eq(true)
    expect(@lottery.interested_and_18?(@benjamin, @mega_millions)).to eq(false)
    expect(@lottery.interested_and_18?(@alexander, @cash_5)).to eq(false)
  end

  it 'can confirm a contestant can register' do 
    expect(@lottery.can_register?(@alexander, @pick_4)).to be(true)
    expect(@lottery.can_register?(@alexander, @cash_5)).to be(false) 
    expect(@lottery.can_register?(@frederick, @mega_millions)).to be(true)
    expect(@lottery.can_register?(@benjamin, @mega_millions)).to be(false)
    expect(@lottery.can_register?(@frederick, @cash_5)).to be(false)
  end
end