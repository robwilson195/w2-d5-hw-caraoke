class Guest

  attr_reader :name, :fave_song, :money

  def initialize(name, song, money)
    @name = name
    @fave_song = song
    @money = money
  end

end
