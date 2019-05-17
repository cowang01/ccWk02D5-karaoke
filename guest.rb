##
class Guest
  attr_reader :name, :age
  attr_accessor :money, :fav_genre, :song #,:drink

  def initialize(name, age, money, fav_genre)
    @name = name
    @age = age
    @money = money
    @fav_genre = fav_genre
    @song = nil
    # @drink = nil

  end


  def chooses_song(song)
    @song = song
  end

  def spends_money(money)
    @money -= money
  end

  ##
end
##
