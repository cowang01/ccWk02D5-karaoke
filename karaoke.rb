
class Karaoke
  attr_accessor :rooms, :till

  def initialize(rooms, till)
    @rooms = rooms
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

  def interface_business
    while
            add song
            customer enters room
            customer exits room
            create guest
            exit
          end
  end

  def customer_interface
    while
      choose song
      add song to queue
      request assistance
      exit
    end
  end




  def interface_lvl2(menu)
    p "MENU"
    p "----------"
    if menu == "admin"
      pass = "******"
      p "Please enter admin password"
      gets.chomp
      if pass == "******"
        interface_business


      end
    else
      interface_customer
    end
  end




  ##
end
##
