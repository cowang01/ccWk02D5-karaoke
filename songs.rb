##
class Song
attr_reader :title, :artist, :length

def initialize(title, artist, length)
  @title = title
  @artist = artist
  @length = length

end

# #  in room
# def find_song_exists(title)
#  return @songs.any? { |song| song.title == title }
# end



##
end
##
