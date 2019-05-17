##
require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../songs.rb')

class TestGuest < MiniTest::Test
  def setup
    @guest_1 = Guest.new("Davie", 34, 55.00, "Rock")
    @guest_2 = Guest.new("Ben", 18, 200.00, "Pop")

    @song_1 = Song.new("Don't Stop Believin'", "Journey", 4.18, "Pop")
  end


  def test_fav_genre
    assert_equal("Rock", @guest_1.fav_genre)
  end

  def test_money
    assert_equal(200.00, @guest_2.money)
  end

  def test_chooses_song
    singer = @guest_1.chooses_song(@song1)
    assert_equal(@song1, singer)
  end

  def test_spends_money
    assert_equal(195.00, @guest_2.spends_money(5.00))
  end

  ##
end
##
