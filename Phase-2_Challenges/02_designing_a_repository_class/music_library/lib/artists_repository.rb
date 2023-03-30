require 'artists'

class ArtistsRepository
    def all
        sql = 'SELECT id, name, genre FROM artists;'
        result_set = DatabaseConnection.exec_params(sql, [])

        artists = []

        result_set.each do |record|
            artist = Artists.new
            artist.id = record["id"]
            artist.name = record["name"]
            artist.genre = record["genre"]

            artists << artist
        end

        return artists

    end
end