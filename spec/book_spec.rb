require_relative '../classes/book'
require_relative '../classes/label'

describe Book do
  let(:label) { Label.new(nil, 'trust me bro', 'aqua') }
  let(:label2) { Label.new(nil, 'dont trust me bro', 'red') }
  let(:book) { Book.new(nil, '2022/01/01', false, 'sid', 'good', label) }
  let(:book2) { Book.new(nil, '2023/01/01', false, 'bram', 'bad', label2) }

  context ' #initialize' do
    it 'creates a new Book instance' do
      expect(book).to be_an_instance_of(Book)
    end

    it 'assigns a valid id to the instance' do
      expect(book.id).to eq(book.id)
    end
  end

  context ' #list' do
    it 'returns and array of available books' do
      expect(Book.all).to be_instance_of(Array)
    end

    it 'returns an array of only Book instances' do
      expect(Book.all.sample.class).to eq(Book)
    end

    it 'returns an array with 2 books' do
      expect(Book.all.length).to eq(2)
    end
  end

  context ' #add book' do
    it 'adds a book' do
      Book.new(nil, '2023/01/01', false, 'imran', 'bad', label2)
      expect(Book.all.length).to eq(1)
    end
  end
end
