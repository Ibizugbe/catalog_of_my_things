require_relative '../modules/prompt'
require_relative '../modules/book_store'
require_relative './book'
require_relative './label'
require_relative 'album_lib'
require_relative 'genre'
require_relative 'music'
require_relative '../modules/author_lib'

class App
  include Prompt

  def initialize
    puts 'Start cataloging your things'
    LabelStore.load_labels
    BookStore.load_books
    AlbumTracker.load_genres
    AlbumTracker.load_albums
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
      BookStore.list_books
      app_navigator('1')
    when '2'
      LabelStore.list_labels
      app_navigator('1')
    when '3'
      BookStore.add_book
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
      AlbumLibrary.list_music_albums
      app_navigator('2')
    when '2'
      AlbumLibrary.list_genres
      app_navigator('2')
    when '3'
      AlbumLibrary.add_music_album
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
      game = AuthorGameLibrary.new
      game.list_games
      app_navigator('3')
    when '2'
      author = AuthorGameLibrary.new
      author.list_authors
      app_navigator('3')
    when '3'
      new_game = AuthorGameLibrary.new
      new_game.add_game
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
