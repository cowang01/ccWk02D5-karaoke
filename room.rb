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

  ##
end
##
