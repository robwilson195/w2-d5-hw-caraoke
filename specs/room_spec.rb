require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../song.rb' )
require_relative( '../guest' )
require_relative( '../room' )

class TestRoom < MiniTest::Test

  def setup
    @song1 = Song.new("Sweet Caroline", "Neil Diamond", "Sweeeeet Caroline, bah bah bah!")
    @song2 = Song.new("Don't Stop Believin'", "Journey", "Don't stop, believin'. Hold on to that feeeeeeeeliiiiin'!")
    @song3 = Song.new("Bohemian Rhapsody", "Queen", "Mamaaaaaaaa, just killed a maaaaan!")
    @song4 = Song.new("Wonderwall", "Oasis", "And after all, your my wonderwall!")
    @song5 = Song.new("My Way", "Frank Sinatra", "I did it, myyyyyyyyyy waaaaaaay!")

    @songs1 = [@song1, @song3, @song4, @song5]
    @songs2 = [@song1, @song2, @song3, @song4, @song5]

    @guest1 = Guest.new("Rob", @song1, 5)
    @guest2 = Guest.new("James", @song2, 10)
    @guest3 = Guest.new("Christina", @song3, 20)

    @room1 = Room.new(1, 5, @songs1, :basic)
    @room2 = Room.new(2, 3, @songs2, :premium)
  end

  def test_room_has_number
    assert_equal(1, @room1.number)
  end

  def test_room_has_guests
    assert_equal([], @room1.guests)
  end

  def test_room_has_capacity
    assert_equal(3, @room2.capacity)
  end

  def test_room_has_playlist
    assert_equal(@songs2, @room2.playlist)
  end

  def test_room_has_class
    assert_equal(:basic, @room1.class)
  end

  def test_room_has_fee
    assert_equal(4, @room1.fee)
  end

end
