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

  def cheer_for_song(songs)
    if songs.include?(@fave_song)
      return "Cool! They have #{@fave_song.name}, my favourite!"
    else
      return false
    end
  end

  def sing_song(song)
    return song.lyrics
  end
end
