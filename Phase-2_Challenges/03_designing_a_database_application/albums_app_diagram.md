> Print below text into www.sequencediagram.org

sequenceDiagram
    participant t as terminal
    participant app as Main program (in app.rb)
    participant ar as AlbumsRepository class <br /> (in lib/albums_repository.rb)
    participant db_conn as DatabaseConnection class in (in lib/database_connection.rb)
    participant db as Postgres database

    Note left of t: Flow of time <br />⬇ <br /> ⬇ <br /> ⬇ 

participant t
participant app
participant ar
participant db_conn
participant db

    t->>app: Runs `ruby app.rb`
    app->>db_conn: Opens connection to database by calling connect method on DatabaseConnection
    db_conn->>db_conn: Opens database connection using PG and stores the connection
    app->>ar: Calls all method on ArtistRepository
    ar->>db_conn: Sends SQL query by calling exec_params method on DatabaseConnection
    db_conn->>db: Sends query to database via the open database connection
    db->>db_conn: Returns an array of hashes, one for each row of the albums table

    db_conn->>ar: Returns an array of hashes, one for each row of the albums table
    loop 
        ar->>ar: Loops through array and creates a Albums object for every row
    end
    ar->>app: Returns array of Albums objects
    app->>t: Prints list of albums to terminal