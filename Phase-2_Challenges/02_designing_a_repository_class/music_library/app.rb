require_relative 'lib/database_connection'
require_relative 'lib/artists_repository'
require_relative 'lib/albums_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library')

artist_repository = ArtistsRepository.new
album_repository = AlbumsRepository.new

# Get the album with id 3
album = album_repository.find(6)

puts album.id
puts album.title
puts album.release_year