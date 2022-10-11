require_relative 'item'

class MusicAlbum < Item
  attr_accessor :name, :on_spotify, :publish_date
  def initialize(name, publish_date, on_spotify = false)
    @name = name
    @on_spotify = on_spotify
    super(publish_date)
  end

  def can_be_archived?
    super && @on_spotify
  end

end