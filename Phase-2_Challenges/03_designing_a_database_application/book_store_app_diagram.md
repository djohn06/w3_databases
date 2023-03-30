> Print below text into www.sequencediagram.org

participant t as terminal
participant app as Main program (in app.rb)
participant br as BooksRepository class (in lib/books_repository.rb)
participant db_conn as DataBaseConnection class in (in lib/database_connection.rb)
participant db as Postgres database

participant t
participant app
participant br
participant db_conn
participant db

t->>app: Runs `ruby app.rb`
app->>db_conn: Opens connection to database by calling connect method on DatabaseConnection
db_conn->>db_conn: Opens database connection using PG and stores the connection
app->>br: Calls all method on BooksRepository
br->>db_conn: Sends SQL query by calling exec_params method on DatabaseConnection
db_conn->>db: Sends query to database via the open database connection
db->>db_conn: Returns an array of hashes, one for each row of the books table

db_conn->>br: Returns an array of hashes, one for each row of the books table
loop 
    br->>br: Loops through array and creates a Books object for every row
end
br->>app: Returns array of Books objects
app->>t: Prints list of books to terminal