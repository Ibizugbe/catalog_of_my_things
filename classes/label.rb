require_relative './item'
require_relative '../modules/label_store'

class Label
  include LabelStore
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

  def to_s
    "id: #{id} title: #{title} color: #{color}"
  end
end
