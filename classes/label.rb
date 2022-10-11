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
    "#{ title }"
  end

  def self.add_label(item)
    puts
    puts 'Label title: '
    titleInput = gets.chomp
    puts
    puts 'Label color: '
    colorInput = gets.chomp
    puts

    newLabel = Label.new(titleInput, colorInput)
    puts 'New label succesfully created'
    puts
    puts newLabel.to_s
  end

  def self.list_labels
    all.each do |label|
      puts label.to_s
      puts
    end
    puts 'No labels avaliable' if all.empty?
  end

end