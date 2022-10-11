require_relative './item'

class Label
  attr_reader :id, :title, :color

  def initialize(id, title, color)
    @id = id || rand(100..999)
    @title = title
    @color = color
    @item = []
  end

  def add_item=(item)
    @items << item
    item.label = self
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def to_s
    "id: #{id} title: #{title} color: #{color}"
  end

  def self.add_label
    puts
    puts 'Label title: '
    title_input = gets.chomp
    puts 'Label color: '
    color_input = gets.chomp

    new_label = Label.new(nil, title_input, color_input)
    puts
    puts 'Label added succesfully'
    puts new_label.to_s

    new_label.save
    new_label
  end

  def self.list_labels
    all.each do |label|
      puts label.to_s
      puts
    end
    puts 'No labels avaliable' if all.empty?
  end

  def save
    if File.exist?('labels.json')
      labels_file = File.read('labels.json')
      labels = JSON.parse(labels_file)
      labels << { id: id, title: title, color: color }
      File.write('labels.json', JSON.pretty_generate(labels))
    else
      File.write('labels.json', JSON.pretty_generate([{ id: id, title: title, color: color }]))
    end
  end

  def self.load_labels
    return unless File.exist?('labels.json')

    labels_file = File.read('labels.json')
    labels = JSON.parse(labels_file)

    labels.each do |label|
      Label.new(label['id'], label['title'], label['color'])
    end
  end
end
