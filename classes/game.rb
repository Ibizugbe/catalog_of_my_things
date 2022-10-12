require_relative './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at
  def initialize
    super(date, multiplayer, last_played_at)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end
  def can_be_archived?
    super && Date.today - Date.parse(@last_played_at) > 730    
  end
end
