
class Karaoke
  attr_accessor :krooms, :till, :guests

  def initialize(krooms, till)
    @krooms = krooms
    @till = till
    @guests = []
    @play_time = nil
    @stage_time = nil
    @play_queue = []
  end


  def interface_menu()
    p "Welcome"
    interface = "empty"
    until (interface == 1) || (interface == 2) || (interface == 3) do
      p "please log in as the numeric: "
      p "1 - admin"
      p "2 - guest"
      p "3 - exit"
      interface = gets.chomp.to_i
    end
    p ""
    p ""
    return interface
  end


  def choose_room()
    if @krooms.count > 1
      p ""
      p "Please type which numbered room you are using: "
      n = 1
      for room in @krooms
        p "#{n} - #{room.location}"
        n += 1
      end
      p ""
      choice = 0
      until (choice <= @krooms.count) && (choice > 0) do
        choice = gets.chomp.to_i
      end
      return @krooms[(choice-1)]
    else
      return @krooms[0]
    end
  end


  def test_interface(room)
    return "Error"
  end


  def interface_business(room)
    user_nav = 0
    while user_nav != 6
      p ""
      p "Please type numeric menu option: "
      p "1 -  Add Song to Library"
      p "2 -  Log in Customer"
      p "3 -  Log Out Customer"
      p "4 -  Check Till And Room Status"
      p "5 -  Close/Open Room"
      p "6 -  Exit Menu"
      p ""
      user_nav = gets.chomp.to_i
      case user_nav
      when 1
        room.add_song_to_room()
      when 2
        if room.available() == true
          guest = @guests.shuffle.first()
          @guests.delete(guest)
          room.add_guest(guest)
          @till += room.price
        else p "room unavailable"
        end
      when 3
        if room.guests.count > 0
          p "who is leaving the room?: "
          n = 1
          for name in room.guests
            p "#{n} - #{guest.name}"
            n += 1
          end
          choice_name = gets.chomp.to_i
          guest = room.guests[(choice_name-1)]
          room.remove_guest(guest)
          @guests << guest
        else p "Room Empty!"
        end
      when 4
        p ""
        p "The current till ballance is £#{@till}"
        @krooms.each do |room|
          p "The #{room.location}room is #{room.status} and has #{room.guests.count} occupants of a possible #{room.max_size}."
        end
        p ""
      when 5
        guests = room.change_status
        @guests += guests
      when 6
        user_nav = 6
      else
        p "invalid option"
      end
    end
  end


  def interface_customer(room)
    while
      choose song
      add song to queue
      request assistance
      feedback
      exit
    end
  end


  def interface_lvl2(menu, room)
    p ""
    p "MENU"
    p "----------"
    if menu == 1
      pass = "******"
      p "Please enter admin password"
      gets.chomp
      if pass == "******"
        interface_business(room)
      else
        p ""
        p "details do not match"
      end
    elsif menu == 2
      interface_customer(room)
    else
      test_interface(room)
    end
  end




  ##
end
##
