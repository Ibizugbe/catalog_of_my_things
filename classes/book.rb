require_relative 'item'
require_relative '../modules/book_store'

class Book < Item
  include BookStore
  attr_reader :publisher, :cover_state, :label

  def initialize(id, publish_date, archived, publisher, cover_state, label)
    super(id, publish_date, archived)
    @publisher = publisher
    @cover_state = cover_state
    @label = label
  end

  def to_s
    title = label.nil? ? '-' : label.title
    index = Book.all.index(self)
    "#{index}) id: #{id}, title: #{title}, publish date: #{publish_date},
    by: #{publisher}, cover: #{cover_state}"
  end

  def can_be_archived?
    super || cover == 'bad'
  end
end
