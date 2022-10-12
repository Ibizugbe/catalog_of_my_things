require_relative 'item'
require_relative 'genre'
require_relative '../modules/album_tracker'


class MusicAlbum < Item
  include AlbumTracker
  attr_accessor :name, :on_spotify, :publish_date, :genre
  def initialize(name, publish_date, id, archived, genre, on_spotify = false)
    @name = name
    @on_spotify = on_spotify
    @genre = genre
    super(id, publish_date, archived)
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_s
    "Album name : #{@name} ~ Published on : #{@publish_date} / #{@on_spotify ? 'Available on spotify' : 'Not available on spotify'}"
  end

end