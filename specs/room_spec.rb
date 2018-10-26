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
    @song6 = Song.new("Africa", "Toto", "I bless the rains donw in Aaaaaaafricaaaa!")

    @songs1 = [@song1, @song3, @song4, @song5]
    @songs2 = [@song1, @song2, @song3, @song4, @song5]

    @guest1 = Guest.new("Rob", @song1, 5)
    @guest2 = Guest.new("James", @song2, 10)
    @guest3 = Guest.new("Christina", @song3, 20)
    @guset4 = Guest.new("Chris", @song1, 20)

    @room1 = Room.new(1, 5, @songs1, :basic)
    @room2 = Room.new(2, 3, @songs2, :premium)
  end

  # def test_room_has_number
  #   assert_equal(1, @room1.number)
  # end
  #
  # def test_room_has_guests
  #   assert_equal([], @room1.guests)
  # end
  #
  # def test_room_has_capacity
  #   assert_equal(3, @room2.capacity)
  # end
  #
  # def test_room_has_playlist
  #   assert_equal(@songs2, @room2.playlist)
  # end
  #
  # def test_room_has_class
  #   assert_equal(:basic, @room1.class)
  # end
  #
  # def test_room_has_fee
  #   assert_equal(4, @room1.fee)
  # end
  #
  # def test_check_availability__true
  #   assert_equal(true, @room1.check_availability)
  # end
  #
  # def test_check_availability__false
  #   @room2.guests << @guest1
  #   @room2.guests << @guest2
  #   @room2.guests << @guest3
  #   assert_equal(false, @room2.check_availability)
  # end
  #
  # def test_add_song
  #   @room1.add_song(@song2)
  #   assert_equal(5, @room1.playlist.length)
  # end
  #
  # def test_check_out_guest
  #   @room1.guests << @guest1
  #   @room1.check_out_guest("Rob")
  #   assert_equal(0, @room1.guests.length)
  # end
  #
  # def test_close_room
  #   @room1.guests << @guest1
  #   @room1.guests << @guest2
  #   @room1.close_room
  #   assert_equal(0, @room1.guests.length)
  # end
  #
  def test_check_guest_in_to_room__success
    message = @room1.check_in_guest(@guest1)
    assert_equal("Check in successful", message)
    assert_equal(1, @room1.guests.length)
    assert_equal(1, @guest1.money)
  end

  def test_check_guest_in_to_room__at_capacity
    @room2.guests << @guest1
    @room2.guests << @guest3
    @room2.guests << @guest4
    message = @room2.check_in_guest(@guest2)
    assert_equal("Room 2 is full.", message)
    assert_equal(0, @room1.guests.length)
    assert_equal(5, @guest1.money)
  end

  def test_check_guest_in_to_room__at_capacity
    message = @room2.check_in_guest(@guest1)
    assert_equal("Rob doesn't have the entry fee.", message)
    assert_equal(0, @room1.guests.length)
    assert_equal(5, @guest1.money)
  end


end
