require_relative 'item'
require_relative 'genre'

class MusicAlbum < Item
  attr_accessor :name, :on_spotify, :publish_date, :genre
  def initialize(name, publish_date, on_spotify = false)
    @name = name
    @on_spotify = on_spotify
    super(publish_date)
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_s
    "Album name : #{@name} ~ Published on : #{@publish_date} / #{@on_spotify ? 'Available on spotify' : 'Not available on spotify'}"
  end

end