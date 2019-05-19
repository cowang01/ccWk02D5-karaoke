#
# Command Line test environment for Kareoke business
#
require_relative('../karaoke.rb')

p""
p""
p "Welcome to Karaoke Business simulator"
p ""
p "Press 1 to create your business parameters, press 0 to use the default test environmet with 2 rooms"

start = gets.chomp

if start == 0
  room_1 = Room.new()
  room_2 = Room.new()

  guest_1 = Guest.new()
  guest_ = Guest.new()
  guest_ = Guest.new()
  guest_ = Guest.new()
  guest_ = Guest.new()
  guest_ = Guest.new()
  guest_ = Guest.new()
  guest_ = Guest.new()

  song_ = Songs.new()
  song_ = Songs.new()
  song_ = Songs.new()
  song_ = Songs.new()
  song_ = Songs.new()
  song_ = Songs.new()
  song_ = Songs.new()

  songs = []
  rooms = []
  karaoke = Karaoke.new(rooms, songs)

  while karaoke.interface() != 5
  end


elsif start == 1
p "Work in progress, please re-run in test environment"

else
  p "Input not recognised"
  p""
  p"Exiting simulator"
end
