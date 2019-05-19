
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
    until (interface.downcase == "admin") || (interface.downcase =="guest") || (interface.downcase =="exit") do
      p "please log in as 'admin', 'guest' or type 'exit'"
      interface = gets.chomp
    end
    p ""
    p ""
    return interface.downcase
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
      choice =  gets.chomp.to_i
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
      p "4 -  Check Till Ballance"
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
        else p "room unavailable"
        end
      when 3
        guest = room.remove_guest
        @guests << guest
      when 4
        p ""
        p "The current till ballance is £#{@till}"
        p ""
      when 5
        room.close
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
    if menu == "admin"
      pass = "******"
      p "Please enter admin password"
      gets.chomp
      if pass == "******"
        interface_business(room)
      else
        p ""
        p "details do not match"
      end
    elsif menu == "guest"
      interface_customer(room)
    else
      test_interface(room)
    end
  end




  ##
end
##
