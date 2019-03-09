require 'pry'

require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../room.rb')
require_relative('../karaoke_bar.rb')

class TestRoom < Minitest::Test

  def setup
    @guests = []
    @guest1 = @guests.push(Guest.new("Michael","Smooth Criminal", 10))
    @guest2 = @guests.push(Guest.new("Billy","Uptown Girl", 20))
    @guest3 = @guests.push(Guest.new("Jenny", "Venus", 30))

    @rooms = []
    @rooms << Room.new("Jackson", 2, 30)
    @karaoke_bar =  KaraokeBar.new(@rooms, @guests)
  end

  def test_create_room
    @karaoke_bar.create_room("Joel", 4, 60)
    assert_equal("Joel", @karaoke_bar.rooms[1].booking_name)
    assert_equal(4, @karaoke_bar.rooms[1].number_of_guests)
    assert_equal(60, @karaoke_bar.rooms[1].booked_time)
  end

  # def test_create_guest
  #
  # end
  #
  # def test_create_song
  #
  # end

  def test_find_room
    result = @karaoke_bar.find_room("Jackson")
    assert_equal(@karaoke_bar.rooms[0], result)
  end

  #Same as create_room?
  # def test_check_in_guest
  #   @karaoke_bar.check_in_guest("Jackson",2, 20)
  #   assert_equal(, result)
  # end

end
