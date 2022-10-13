require 'json'
require_relative '../classes/author'
require_relative '../classes/game'

module AuthorGameTrack
  
  def store_games
    if File.exist?('games.json')
      data = File.read('games.json')
      games = JSON.parse(data)
      games << { id: id, name: name }
      File.write('./games.json', JSON.pretty_generate(games))
    else
      File.write('./games.json', JSON.pretty_generate([{ id: id, name: name }]))
    end
  end 

  # load from json file
  def load_games
    return unless File.exist?('games.json')

    data = File.read('games.json')
    games = JSON.parse(data)
    games.each do |genre|
      Game.new(games['id'], games['multiplayer'], games['last_played_at'], games['publish_date'], games['archived'])
    end
  end
end   

# store game file
# def store_genre
#   if File.exist?('games.json')
#     data_hash = File.read('games.json')
#     games = JSON.parse(data_hash)
#     games << { id: id, multiplayer: multiplayer, last_played_at: last_played_at, publish_date: publish_date, archived: archived  }
#     File.write('./games.json', JSON.pretty_generate(genres))
#   else
#     File.write('./gamess.json', JSON.pretty_generate([{ id: id, multiplayer: multiplayer, last_played_at: last_played_at, publish_date: publish_date, archived: archived }]))
#   end
# end

# def list_games
#   @games.each do |game|
#     puts "Date: #{game.id}, \n multiplayer: #{game.multiplayer}"
#     puts "last_played_at: #{game.last_played_at}, \n publish_date: #{game.publish_date}, \n archived: #{game.archived}"
#   end
# end

# def list_authors
#   @authors.each do |author|
#     puts "#{author.first_name} #{author.last_name}"
#   end
# end

# def add_game
#   print('First Name of the author of the game: ')
#   first_name = gets.chomp
#   print('Last Name of the author of the game: ')
#   last_name = gets.chomp
#   @authors << Author.new(first_name, last_name)
#   puts @authors

#   print('Type yes if multiplayer or No if otherwise: ')
#   multiplayer = gets.chomp
#   print('Date played: ')
#   last_played_at = gets.chomp
#   print('Game ID: ')
#   id = gets.chomp.to_i
#   print('Date game was published: ')
#   publish_date = gets.chomp.to_i
#   print('Do you want this game to be archived Yes|No: ')
#   archived = gets.chomp.to_i
#   @games << Game.new(multiplayer, last_played_at, id, publish_date, archived)
#   puts @games
#   puts('Author and Game created successfully')
# end

