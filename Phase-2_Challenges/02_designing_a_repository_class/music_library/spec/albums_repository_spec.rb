require 'albums_repository'

RSpec.describe AlbumsRepository do

    # This Reload the SQL seeds before each test run
    def reset_albums_table
        seed_sql = File.read('./spec/seeds_albums.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
        connection.exec(seed_sql)
    end

    before(:each) do 
        reset_albums_table
    end

    it 'returns two albums' do
        repo = AlbumsRepository.new

        albums = repo.all

        expect(albums.length).to eq(2)
        expect(albums.first.title).to eq('Thriller')
        expect(albums.first.release_year).to eq('1982')
        expect(albums.first.artist_id).to eq('5')
    end

end