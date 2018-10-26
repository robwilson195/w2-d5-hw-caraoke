require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../song.rb' )
require_relative( '../guest' )

class TestGuest < MiniTest::Test

  def setup
    @song1 = Song.new("Sweet Caroline", "Neil Diamond", "Sweeeeet Caroline, bah bah bah!")
    @song2 = Song.new("Don't Stop Believin'", "Journey", "Don't stop, believin'. Hold on to that feeeeeeeeliiiiin'!")
    @song3 = Song.new("Bohemian Rhapsody", "Queen", "Mamaaaaaaaa, just killed a maaaaan!")
    @song4 = Song.new("Wonderwall", "Oasis", "And after all, your my wonderwall!")
    @song5 = Song.new("My Way", "Frank Sinatra", "I did it, myyyyyyyyyy waaaaaaay!")

    @guest1 = Guest.new("Rob", @song1, 5)
    @guest2 = Guest.new("James", @song2, 10)
    @guest3 = Guest.new("Christina", @song3, 20)
  end

  def test_person_has_name
    assert_equal("Rob", @guest1.name)
  end

  def test_person_has_fave_song
    assert_equal(@song2, @guest2.fave_song)
  end

  def test_person_has_money
    assert_equal(20, @guest3.money)
  end

  def test_pay_money
    @guest3.pay_money(5)
    assert_equal(15, @guest3.money)
  end

  def test_check_affordable__true
    assert_equal(true, @guest3.check_affordable(10))
  end

  def test_check_affordable__false
    assert_equal(false, @guest1.check_affordable(10))
  end

  def test_cheer_for_song__song_found
    songs = [@song1, @song3, @song4]
    assert_equal("Cool! They have Bohemian Rhapsody, my favourite!", @guest3.cheer_for_song(songs))
  end

  def test_cheer_for_song__song_not_found
    songs = [@song1, @song3, @song4]
    assert_equal(false, @guest2.cheer_for_song(songs))
  end

  def test_sing_song
    assert_equal("I did it, myyyyyyyyyy waaaaaaay!", @guest1.sing_song(@song5))
  end
end
