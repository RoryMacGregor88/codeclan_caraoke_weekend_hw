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

  def test_create_guest
    @karaoke_bar.create_new_guest("Eddie", "Jump", 50)
    assert_equal("Eddie", @karaoke_bar.guests[3].name)
    assert_equal("Jump", @karaoke_bar.guests[3].guest_fav_song)
    assert_equal(50, @karaoke_bar.guests[3].guest_money)
  end

  def test_create_room__check_in_guest
    @karaoke_bar.create_room__check_in_guest("Joel", 4, 60)
    assert_equal("Joel", @karaoke_bar.rooms[1].booking_name)
    assert_equal(4, @karaoke_bar.rooms[1].number_of_guests)
    assert_equal(60, @karaoke_bar.rooms[1].booked_time)
  end

  def test_find_booked_room
    result = @karaoke_bar.find_room("Jackson")
    assert_equal(@karaoke_bar.rooms[0], result)
  end

  def test_check_out_guest__remove_room
    @karaoke_bar.create_room__check_in_guest("Turner", 4, 90)
    assert_equal(2, @karaoke_bar.rooms.count)
    @karaoke_bar.check_out_guest__remove_room("Turner")
    assert_equal(1, @karaoke_bar.rooms.count)
  end

  def test_too_many_guests_in_room
    @karaoke_bar.create_room__check_in_guest("Turner", 4, 90)
    assert_equal(2, @karaoke_bar.rooms.count)
    result = @karaoke_bar.create_room__check_in_guest("Van Halen", 8, 60)
    assert_equal("Max capacity: 5", result)
  end

  # def test_customer_favourite_song
  #   @guest = @karaoke_bar.create_new_guest("Tina", "Nutbush City Limits", 50)
  #   result = ()
  # end

end
