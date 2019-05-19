require('minitest/autorun')
require('minitest/rg')
require_relative('../karaoke.rb')
require_relative('../songs.rb')
require_relative('../guest.rb')
require_relative('../room.rb')

class TestCustomer < MiniTest::Test
  def setup
    @song_1 = Song.new("Don't Stop Believin'", "Journey", 4.18, "Pop")
    @song_2 = Song.new("Bohemian Rhapsody", "Queen", 5.92, "Rock")
    @song_3 = Song.new("Bat Out of Hell", "MeatLoaf", 9.85, "Rock")

    @room_1 = Room.new("North", 4, 10.00)
    @room_2 = Room.new("South", 12, 8.00)

    @guest_1 = Guest.new("Davie", 34, 55.00, "Rock")
    @guest_2 = Guest.new("Ben", 18, 200.00, "Pop")

    @room_1.songs = [@song_1, @song_2, @song_3]
    @room_2.songs = [@song_1, @song_2]
    @rooms = [@room_1, @room_2]

    @karaoke = Karaoke.new(@rooms, 1000.00)

  end

  def test_rooms_in_karaoke
    assert_equal(2, @karaoke.rooms.count)
  end

  def test_menu_interface
    user_choice = @karaoke.interface_menu()
    assert_equal("admin", user_choice)
  end

  def test_interface_business
    user_choice = @karaoke.main_interface("admin")
    assert_equal("upload_song", user_choice)
  end



  ##
end
##
