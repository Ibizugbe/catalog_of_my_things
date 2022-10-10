require_relative '../modules/prompt'

class App
  include Prompt

  def initialize
    puts 'Start cataloging your things'
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
    when '2'
      Label.list_labels
    when '3'
      Book.add_book
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
    when '2'
      Genre.list_genres
    when '3'
      MusicAlbum.add_music_album
    when '4'
      run
    else
      puts 'That is not a valid option'
    end
  end

  def games_navigator(option)
    case option
    when '1'
      Game.list_games
    when '2'
      Author.list_authors
    when '3'
      Game.add_game
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
