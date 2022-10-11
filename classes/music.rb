require_relative 'item'

class MusicAlbum < Item
  def initialize(name, genre, publish_date, on_spotify)
    @name = name
    @genre = genre
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super and @on_spotify
  end

end