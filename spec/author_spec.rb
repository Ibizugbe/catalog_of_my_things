require_relative '../classes/author'
require_relative '../classes/game'

describe Author do
  let(:author) { Author.new('John', 'Doe') }
  let(:game) { Game.new('multiplayer', '2019-12-12', 3, '2019-12-12', false) }

  describe '#author class' do
    it 'should be an instance of Author' do
      expect(author).to be_an_instance_of(Author)
    end

    it 'should have a last name' do
      expect(author.last_name).to eq('Doe')
    end

    it 'should have an id' do
      expect(author.id).to be_between(1, 1000)
    end

    it 'should have an empty array of items' do
      expect(author.items).to eq([])
    end
  end

  describe '#add_item' do
    it 'adds item to author' do
      author.add_item(game)
      expect(author.items).to include(game)
    end

    it 'adds author to item' do
      author.add_item(game)
      expect(game.author).to eq(author)
    end

    it 'does not add author to item if item already has author' do
      author.add_item(game)
      author.add_item(game)
      expect(game.author).to eq(author)
    end
  end

  describe '#Game class' do
    it 'be instance of' do
      expect(game).to be_instance_of(Game)
    end

    it 'should have a date' do
      expect(game.publish_date).to eq('2019-12-12')
    end
  end
end
