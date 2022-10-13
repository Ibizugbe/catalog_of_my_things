require_relative '../classes/music'
require_relative '../classes/album_lib.rb'

describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new('Join me', '2010-02-02', 1, true, 'pop', true)
  end

  describe '#new' do
    it 'takes 2 parameters and returns a MusicAlbum object' do
      expect(@music_album).to be_instance_of MusicAlbum
    end
  end

  describe '#on_spotify' do
    it 'returns correct state' do
      expect(@music_album.on_spotify).to eq true
    end
  end
end