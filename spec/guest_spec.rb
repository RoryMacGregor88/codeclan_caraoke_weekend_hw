require 'pry'

require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../room.rb')
require_relative('../karaoke_bar.rb')

class TestGuest < Minitest::Test

  def setup
    @guests = []
    @guest1 = @guests.push(Guest.new("Michael","Smooth Criminal", 10))
    @guest2 = @guests.push(Guest.new("Billy","Uptown Girl", 20))
    @guest3 = @guests.push(Guest.new("Jenny", "Venus", 30))

    @rooms = []
    @room1 = @rooms.push(Room.new("Jackson", 2, 30))

    @karaoke_bar = [@rooms, @guests]
  end

  # def test_guest_can_sing_song
  #   @guest1.sing_song(@song1)
  #   assert_equal(1, @guest1.songs_sang.length)
  # end

end
