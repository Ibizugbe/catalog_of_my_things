require_relative 'author'
require_relative 'game'
require_relative '../modules/author_track'

class AuthorGameLibrary
  include AuthorGameTrack
  
  def self.list_games    
    games.all.each_with_index do |album, i|
      puts "#{i + 1}) Name: #{album.name} || published on #{album.publish_date} || Is on spotify? = #{album.on_spotify}"
    end
  end  
end
