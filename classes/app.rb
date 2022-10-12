require_relative '../modules/prompt'
require_relative './book'
require_relative './label'
require_relative './author'
require_relative './game'

class App
  include Prompt

  def initialize
    puts 'Start cataloging your things'
    Label.load_labels
    Book.load_books
    @games = []
    @authors = []
  end

  def app_navigator(option)
    case option
    when '1'
      books_prompt
      books_navigator(gets.chomp)
    when '2'
      music_albums_prompt
      music_albums_navigator(gets.chomp)
    when '3'
      games_prompt
      games_navigator(gets.chomp)
    else
      puts 'That is not a valid option'
    end
  end

  def books_navigator(option)
    case option
    when '1'
      Book.list_books
      app_navigator('1')
    when '2'
      Label.list_labels
      app_navigator('1')
    when '3'
      Book.add_book
      app_navigator('1')
    when '4'
      run
    else
      puts 'That is not a valid option'
    end
  end

  def music_albums_navigator(option)
    case option
    when '1'
      MusicAlbum.list_music_albums
      app_navigator('2')
    when '2'
      Genre.list_genres
      app_navigator('2')
    when '3'
      MusicAlbum.add_music_album
      app_navigator('2')
    when '4'
      run
    else
      puts 'That is not a valid option'
    end
  end

  def games_navigator(option)
    case option
    when '1'
      @games.each do |game|
        puts "Date: #{game.id}, \n multiplayer: #{game.multiplayer}"
        puts "last_played_at: #{game.last_played_at}, \n publish_date: #{game.publish_date}, \n archived: #{game.archived}"
      end
      app_navigator('3')

    when '2'
      @authors.each do |author|
        puts "#{author.first_name} #{author.last_name}"
      end
      app_navigator('3')

    when '3'
      print('First Name of the author of the game: ')
      first_name = gets.chomp
      print('Last Name of the author of the game: ')
      last_name = gets.chomp
      @authors << Author.new(first_name, last_name)

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
      puts('Author and Game created successfully')
      app_navigator('3')
    when '4'
      run
    else
      puts 'That is not a valid option'
    end
  end

  def run
    app_prompt
    option = gets.chomp
    if option == '4'
      puts 'Thank you for using this app'
      exit
    end
    app_navigator(option)
  end
end
