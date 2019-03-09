require 'pry'

require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../room.rb')

class TestRoom < Minitest::Test

  def setup
    @guests = []
    @Michael = @guests.push(Guest.new("Michael","Smooth Criminal"))
    @Billy = @guests.push(Guest.new("Billy","Uptown Girl"))
    @Jenny = @guests.push(Guest.new("Jenny", "Venus"))

    @songs = []
    @Off_The_Wall = @songs.push(Song.new("Off The Wall", "Motown", 3))
    @Uptown_Girl = @songs.push(Song.new("Uptown Girl", "Pop", 4))
    @Venus = @songs.push(Song.new("Venus", "Pop", 2))

    @room = Room.new(1, 2, 30, @songs)
  end

  def test_guest_names
    names = @guests.map {|i| i.name}
    assert_equal(["Michael", "Billy", "Jenny"], names)
  end
  def test_guest_fave_songs
    favourite_songs = @guests.map {|i| i.favourite_song}
    assert_equal(["Smooth Criminal", "Uptown Girl", "Venus"], favourite_songs)
  end

  def test_find_song
    result = @room.find_song("Uptown Girl")
    assert_equal(@songs[1], result)
  end

  def test_add_song_to_queue
    @room.add_song_to_queue("Venus")
    assert_equal(1, @room.song_queue.length)
  end

  # def test_check_in_guest
  #   result = @room1.check_in_guest(@Michael.check_in(2, 20))
  #   assert_equal("Guests: 2, Time: 20 minutes", result)
  # end
end
