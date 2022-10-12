

class Author
  def initialize(id, first_name, last_name)
    super(id)
    @first_name = first_name
    @last_name = last_name    
  end
end

class Owner
  attr_accessor :name
  attr_reader :animals

  def initialize(name)
    @name = name
    @animals = []
  end

  # Instead of setter for entire collection a method to add animals one by one
  def add_animal(animal)
    @animals.push(animal)
  end
end