##
require('minitest/autorun')
require('minitest/rg')
require_relative('../songs.rb')

class TestCustomer < MiniTest::Test
  def setup
    @song_1 = Song.new("Don't Stop Believin'", "Journey", 4.18)
    @song_2 = Song.new("Bohemian Rhapsody", "Queen", 5.92)
    @song_3 = Song.new("Bat Out of Hell", "MeatLoaf", 9.85)

    @songs = [@song_1, @song_2, @song_3]
  end



  def test_get_song_name
    assert_equal("Bat Out of Hell", @song_3.title)
  end


  def test_all_song_lenths
    all_songs = @song_1.length + @song_2.length + @song_3.length
    assert_equal(19.95, all_songs)
  end

##in room
  # def test_song_exists__yes
  #   title = @song_2.title
  #   assert_equal(true, @songs.find_song_exists(title))
  # end
  #
  # def test_song_exists__no
  #   title = "Boom Boom Boom"
  #   assert_equal(false, @songs.find_song_exists(title))
  # end

## in room - find song by artist
##
end
##
