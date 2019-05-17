##
class Song
attr_reader :title, :artist, :length, :genre

def initialize(title, artist, length, genre)
  @title = title
  @artist = artist
  @length = length
  @genre = genre

end

# #  in room
# def find_song_exists(title)
#  return @songs.any? { |song| song.title == title }
# end



##
end
##
