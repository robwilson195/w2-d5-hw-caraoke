require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../song.rb' )

class TestSong < MiniTest::Test
  # Sweet Caroline – Neil Diamond.
  # Don't Stop Believin' – Journey.
  # Bohemian Rhapsody – Queen.
  # Wonderwall – Oasis.
  # My Way – Frank Sinatra.
  def setup
    @song1 = Song.new("Sweet Caroline", "Neil Diamond", "Sweeeeet Caroline, bah bah bah!")
    @song2 = Song.new("Don't Stop Believin'", "Journey", "Don't stop, believin'. Hold on to that feeeeeeeeliiiiin'!")
    @song3 = Song.new("Bohemian Rhapsody", "Queen", "Mamaaaaaaaa, just killed a maaaaan!")
    @song4 = Song.new("Wonderwall", "Oasis", "And after all, your my wonderwall!")
    @song5 = Song.new("My Way", "Frank Sinatra", "I did it, myyyyyyyyyy waaaaaaay!")
  end

  def test_song_has_name
    assert_equal("Sweet Caroline", @song1.name)
  end

  def test_song_has_artist
    assert_equal("Journey", @song2.artist)
  end

  def test_song_has_lyrics
    assert_equal("Mamaaaaaaaa, just killed a maaaaan!", @song3.lyrics)
  end

end
