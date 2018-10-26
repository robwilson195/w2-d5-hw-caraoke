class Guest

  attr_reader :name, :fave_song, :money

  def initialize(name, song, money)
    @name = name
    @fave_song = song
    @money = money
  end

  def pay_money(cost)
    @money -= cost
  end

  def check_affordable(cost)
    return @money >= cost
  end

end
