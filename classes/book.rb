require_relative 'item'

class Book < Item
  attr_reader :publisher, :cover

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
    "#{index}) ID: #{id}, published in #{publish_date}, by #{@publisher}, cover: #{@cover_state}, archived: #{archived}."
    
  end

  def can_be_archived?
    super || cover == 'bad'
  end

  def self.add_book
    puts
    puts 'publisher name: '
    pubInput = gets.chomp
    puts
    puts 'publish date(yyyy / mm / dd): '
    dateInput = gets.chomp
    puts
    puts 'cover state(good / bad): '
    coverInput = gets.chomp

    newBook = Book.new(nil, Date.parse(dateInput), false, pubInput, coverInput)
    puts
    puts 'Book added succesfully'
    puts newBook.to_s
  end

  def self.list_books
    all.each do |book|
      puts
      puts book.to_s
    end
    puts 'No books avaliable' if all.empty?
  end

end