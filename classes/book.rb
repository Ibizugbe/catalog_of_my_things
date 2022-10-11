require_relative 'item'
require 'json'
require 'date'

class Book < Item
  attr_reader :publisher, :cover_state

  def initialize(id, publish_date, archived, publisher, cover_state)
    super(id, publish_date, archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def to_s
    index = Book.all.index(self)
    "#{index}) ID: #{id}, published in #{publish_date},
    by #{@publisher}, cover: #{@cover_state}, archived: #{archived}"
  end

  def can_be_archived?
    super || cover == 'bad'
  end

  def self.add_book
    puts
    puts 'publisher name: '
    pub_input = gets.chomp
    puts
    puts 'publish date(yyyy / mm / dd): '
    date_input = gets.chomp
    puts
    puts 'cover state(good / bad): '
    cover_input = gets.chomp

    new_book = Book.new(nil, Date.parse(date_input), false, pub_input, cover_input)
    puts
    puts 'Book added succesfully'
    puts new_book.to_s

    new_book.save
  end

  def self.list_books
    all.each do |book|
      puts
      puts book.to_s
    end
    puts 'No books avaliable' if all.empty?
  end

  def save
    if File.exist?('books.json')
      books_file = File.read('books.json')
      books = JSON.parse(books_file)
      books << { id: id, publish_date: publish_date, archived: archived, publishers: publisher, cover: cover_state }
      File.write('books.json', JSON.pretty_generate(books))
    else
      File.write('books.json',
                 JSON.pretty_generate([{ id: id, publish_date: publish_date, archived: archived, publisher: publisher,
                                         cover: cover_state }]))
    end
  end

  def self.load_books
    return unless File.exist?('books.json')

    books_file = File.read('books.json')
    books = JSON.parse(books_file)
    books.each do |book|
      Book.new(book['id'], Date.parse(book['publish_date']), book['archived'], book['publisher'], book['cover'])
    end
  end
end
