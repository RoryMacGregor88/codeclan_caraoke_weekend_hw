require 'pry'

require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../karaoke_bar.rb')

class TestGuest < Minitest::Test

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
  # binding.pry
  def test_guest_can_select_song
    result = @guests[1].select_song("Uptown Girl")
    assert_equal(@songs[1], result)
  end

  # def test_guest_can_sing_song
  #   @Michael.sing_song(@song1)
  #   assert_equal(1, @Michael.songs_sang.length)
  # end

end
