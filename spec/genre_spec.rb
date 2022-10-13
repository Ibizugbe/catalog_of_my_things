require_relative '../classes/item'
require_relative '../music/genre'
require_relative '../album_lib.rb'

describe Genre do
  before :each do
    @genre = Genre.new('Pop')
  end

  it 'contain a name' do
    expect(@genre.name).to eq('Pop')
  end

  it 'has items' do
    expect(@genre.items).to eq([])
  end

  it 'can add items' do
    @genre.add_item(Items.new('Jazz'))
    expect(@genre.items.length).to eq(1)
  end
end