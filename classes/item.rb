require 'date'

class Item
  attr_reader :id, :publish_date, :archived

  def initialize(id, publish_date, archived)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def genre=(genre)
    @genre = genre
    genre.add_item(self)
  end

  def author=(author)
    @author = author
    author.add_item(self)
  end

  def source=(source)
    @source = source
    source.add_item(self)
  end

  def label=(label)
    @label = genre
    label.add_item(self)
  end

  def can_be_archived?
    Date.today.year - publish_date.year > 10
  end

  def move_to_archived?
    @archived = true if can_be_archived?
  end
end
