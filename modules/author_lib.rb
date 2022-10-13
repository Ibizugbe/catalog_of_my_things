require_relative '../classes/author'
require_relative '../classes/game'

class AuthorGameLibrary
  def initialize
    @games = []
    @authors = []
  end

  def list_games
    @games.each do |game|
      puts "Date: #{game.id}, \n multiplayer: #{game.multiplayer}"
      puts "last_played_at: #{game.last_played_at}, \n publish_date: #{game.publish_date}, \n archived: #{game.archived}"
    end
  end

  def list_authors
    @authors.each do |author|
      puts "#{author.first_name} #{author.last_name}"
    end
  end

  def add_game
    print('First Name of the author of the game: ')
    first_name = gets.chomp
    print('Last Name of the author of the game: ')
    last_name = gets.chomp
    @authors << Author.new(first_name, last_name)
    puts @authors

    print('Type yes if multiplayer or No if otherwise: ')
    multiplayer = gets.chomp
    print('Date played: ')
    last_played_at = gets.chomp
    print('Game ID: ')
    id = gets.chomp.to_i
    print('Date game was published: ')
    publish_date = gets.chomp.to_i
    print('Do you want this game to be archived Yes|No: ')
    archived = gets.chomp.to_i
    @games << Game.new(multiplayer, last_played_at, id, publish_date, archived)
    puts @games
    puts('Author and Game created successfully')
  end
end
