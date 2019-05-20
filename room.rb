##
class Room
  attr_reader :location, :max_size, :price
  attr_accessor :status, :songs, :guests, :play_queue

  def initialize(location, max_size, price)
    @location = location
    @max_size = max_size
    @price = price
    @status = "closed"
    @songs = []
    @guests = []
    @play_queue = {}
  end



  def add_guest(guest)
    if guest.money >= @price
      p "Please confirm you have charged #{guest.name} £#{@price}"
      gets.chomp
      @guests << guest
      guest.money -= @price
    else p "guest does not have enough money"
    end
  end

  def available
    @guests.count < @max_size && @status == "open"
  end


  def add_song_to_room()
    p "Please enter the song to be added to the room:- "
    print "title:"
    title = gets.chomp
    print "artist:"
    artist = gets.chomp
    print "length (e.g. 2.8):"
    length = gets.chomp
    print "genre:"
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

  def remove_guest(name)
    @guests.delete(name)
  end


  def change_status()
    p "what would you like to do?"
    p "1 - Open Room #{@location}"
    p "2 - Close Room #{@location}"
    p ""
    choice_status = gets.chomp.to_i
    if choice_status == 1
      @status = "open"
      return []
    elsif choice_status == 2
      @status = "closed"
      return @guests
      @guests = []
    else
      p "invalid option"
    end
  end


  def add_song_to_queue()
    p "Please enter your name."
    name = gets.chomp
    p "How would you like to add your song?"
    p "1 - Search by Genre"
    p "2 - Search for a Title"
    p "3 - Add Random Song"
    p ""
    song_choice = gets.chomp.to_i
    case song_choice
    when 1
      genres = @songs.map { |song| song.genre }
      uniq_genre = genres.uniq { |genre| genre }
      uniq_genre.each { |uniq| p uniq }
      p "please choose a genre"
      genre_choice = gets.chomp
      for song in @songs
        if song.genre == genre_choice
          p song.title
        end
      end
      p "What song would you like?"
      title_choice = gets.chomp.capitalize!
      for song in @songs
        if song.title == title_choice
          @play_queue[name] = song
        end
      end
    when 2
      chosen_song = nil
      search = 1
      while search == 1
        p "what song would you like to seach for?"
        song_title = gets.chomp.capitalize!
        for song in @songs
          # song_check = @songs.include?(song_title)
          if song.title == song_title
            chosen_song = @songs.find { |song| song.title == song_title}
            search = 2
          end

          p "Sorry, that song is not available.  Would you like to search again?"
          p "1 - Yes"
          p "2 - No"
          search = gets.chomp.to_i
        end
      end
      @play_queue[name] = chosen_song
    when 3
      rand = random_song(@songs)
      @play_queue[name] = rand
      p ""
    else p "Invalid Input"
      p ""
    end
  end


  ##
end
##
