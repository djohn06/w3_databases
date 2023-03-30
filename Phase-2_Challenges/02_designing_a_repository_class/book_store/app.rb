require_relative 'lib/database_connection'
require_relative 'lib/books_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('book_store')


books_repository = BooksRepository.new

# Print out each record from the result set .
books_repository.each do |book|
  p book
end