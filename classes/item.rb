require 'date'

class Item
  attr_reader :id, :publish_date, :archived

  def initialize(id, publish_date, archived = false)
    @id = id || rand(1..100)
    @publish_date = publish_date || Time.at(rand * Time.now.to_i).strftime('%Y/%m/%d')
    @archived = archived
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def genre=(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.add_item(self) unless author.items.include?(self)
  end

  def source=(source)
    @source = source
    source.add_item(self) unless source.items.include?(self)
  end

  def label=(label)
    @label = label
    label.add_item(self) unless label.items.include?(self)
  end

  def can_be_archived?
    @publish_date.year < (Date.today - 10).year
  end

  def move_to_archived?
    @archived = true if can_be_archived?
  end

  def list_items
    all.each do |item|
      puts item.to_s
    end

    puts 'No items avaliable' if all.empty?
  end
end
