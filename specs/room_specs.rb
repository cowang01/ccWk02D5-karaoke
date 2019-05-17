##
require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../songs.rb')

class TestRoom < MiniTest::Test
  def setup
    @room_1 = Room.new("North", 4, 10.00)
    @room_2 = Room.new("South", 12, 8.00)

    @guest_1 = Guest.new("Davie", 34, 55.00, "Rock")
    @guest_2 = Guest.new("Ben", 18, 200.00, "Pop")

    @song_1 = Song.new("Don't Stop Believin'", "Journey", 4.18, "Pop")
    @song_2 = Song.new("Bohemian Rhapsody", "Queen", 5.92, "Rock")
    @song_3 = Song.new("Bat Out of Hell", "MeatLoaf", 9.85, "Rock")

    @room_1.songs = [@song_1, @song_2, @song_3]

  end


  def test_room_song_number
    assert_equal(3, @room_1.songs.count)
  end

  def test_room_price
    assert_equal(8.0, @room_2.price)
  end

  def test_room_is_available__yes
    @room_1.status = "open"
    check = @room_1.available()
    assert_equal(true, check)
  end

  def test_room_is_available__no
    @room_1.status = "open"
    @room_1.add_guest(@guest_1)
    @room_1.add_guest(@guest_1)
    @room_1.add_guest(@guest_1)
    @room_1.add_guest(@guest_1)
    check = @room_1.available()
    assert_equal(false, check)
  end

  def test_


  ##
end
##
