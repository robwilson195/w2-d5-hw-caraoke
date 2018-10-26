class Song

  attr_reader :name, :artist, :lyrics

  def initialize(name, artist, lyrics)
    @name = name
    @artist = artist
    @lyrics = lyrics
  end

end
