##
class Room
  attr_reader :location, :max_size, :price
  attr_accessor :status, :songs, :guests

  def initialize(location, max_size, price)
    @location = location
    @max_size = max_size
    @price = price
    @status = "closed"
    @songs = []
    @guests = []
  end


  def add_guest(guest)
    @guests << guest
  end

  def available
    @guests.count < @max_size && @status == "open"
  end

  def add_song_to_room(song)
    @songs << song
  end

  def find_songs_artist(artist)
    all_artist = []
    for song in @songs
      if song.artist == artist
        all_artist << song
      end
    end
    return all_artist
  end

  def find_songs_genre(genre)
    all_genre = []
    for song in @songs
      if song.genre == genre
        all_genre << song
      end
    end
    return all_genre
  end

  def random_song(songs)
    return songs.shuffle.first()
  end



  ##
end
##
