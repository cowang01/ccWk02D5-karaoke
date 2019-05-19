#
# Command Line test environment for Kareoke business
#
require_relative('./karaoke.rb')
require_relative('./songs.rb')
require_relative('./guest.rb')
require_relative('./room.rb')

p ""
p ""
p "Welcome to Karaoke Business simulator"
p ""
p "Press 1 to create your business parameters, press 0 to use the default test environmet with 2 rooms"
p ""
start = gets.chomp.to_i
p ""
p ""
p ""
if start == 0
  @room_1 = Room.new("North", 5, 10.00)
  @room_2 = Room.new("South", 10, 5.00)

  @guest_1 = Guest.new("Davie", 25, 20.00, "Rock")
  @guest_2 = Guest.new("Ben", 17, 30.00, "Pop")
  @guest_3 = Guest.new("Joe", 34, 100.00, "Rock")
  @guest_4 = Guest.new("Sam", 62, 200.00, "Folk")
  @guest_5 = Guest.new("Lucy", 16, 5.00, "Pop")
  @guest_6 = Guest.new("Janice", 29, 5.00, "Rock")
  @guest_7 = Guest.new("Mo", 54, 700.00, "Blues")
  @guest_8 = Guest.new("Ricky", 10, 1.00, "Anything")

  @song_1 = Song.new("Don't stop believin'", "Journey", 4.18, "Pop")
  @song_2 = Song.new("Bohemian rhapsody", "Queen", 5.92, "Rock")
  @song_3 = Song.new("Bat out of Hell", "MeatLoaf", 9.85, "Rock")
  @song_4 = Song.new("Wonderwall", "Oasis", 4.2, "Pop")
  @song_5 = Song.new("Superwoman", "Alicia Keys", 5.2, "RnB")
  @song_6 = Song.new("Cake by the ocean", "DNCE", 3.9, "Pop")
  @song_7 = Song.new("Chandelier", "Sia", 4.8, "Pop")

  @songs = [@song_1, @song_2, @song_3, @song_4, @song_5, @song_6, @song_7]
  @rooms = [@room_1, @room_2]
  @guests = [@guest_1, @guest_2, @guest_3, @guest_4, @guest_5, @guest_6, @guest_7, @guest_8]

  @karaoke = Karaoke.new(@rooms, 1000.00)
  @room_1.songs = @songs
  @room_2.songs = @songs
  @karaoke.guests = @guests


  main_menu = 0
  while main_menu != 3 do
    main_menu = @karaoke.interface_menu()
    if main_menu !=3
      sub_menu = 0
      while sub_menu != 3 do
        sub_menu = @karaoke.interface_lvl2(main_menu)
      end
    end
    p ""
    p ""
  end


elsif start == 1
  p "Work in progress, please re-run in test environment"

else
  p "Input not recognised"
  p ""
  p "Exiting simulator"
end
