class ColoradoLottery
  attr_reader :registered_contestants,
              :winners

  def initialize 
    @registered_contestants = Hash.new(0)
    @winners = []
  end

  def interested_and_18?(contestant, game)
    if contestant.age >= 18 && contestant.game_interests.include?(game.name)
      true
    else 
      false 
    end
  end

  def can_register?(contestant, game)
    if self.interested_and_18?(contestant, game) == true
      true
    else
      false
    end
  end
end