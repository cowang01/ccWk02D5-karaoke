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
    p "Please confirm you have charged #{guest.name} £#{@price}"
    gets.chomp
    @guests << guest
  end

  def available
    @guests.count < @max_size && @status == "open"
  end

  def add_song_to_room()
    p "Please enter title, Artist, Length, Genre(e.g. '3.8')"
    title = gets.chomp
    artist = gets.chomp
    length = gets.chomp
    genre = gets.chomp
    song = Song.new(title, artist, length, genre)
    @songs << song
    p ""
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
