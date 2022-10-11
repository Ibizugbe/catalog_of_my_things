class Label
  attr_reader :id, :title, :color

  def initialize(title, color)
    @id = Rand(100..999)
    @title = title
    @color = color
  end

  def add_item=(item)
    @items << item
    item.label = self
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def to_s
    title.to_s
  end

  def self.add_label(_item)
    puts
    puts 'Label title: '
    title_input = gets.chomp
    puts
    puts 'Label color: '
    color_input = gets.chomp
    puts

    new_label = Label.new(title_input, color_input)
    puts 'New label succesfully created'
    puts
    puts new_label.to_s
  end

  def self.list_labels
    all.each do |label|
      puts label.to_s
      puts
    end
    puts 'No labels avaliable' if all.empty?
  end
end
