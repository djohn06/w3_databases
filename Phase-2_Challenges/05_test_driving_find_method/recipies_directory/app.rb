require_relative 'lib/database_connection'
require_relative 'lib/recipies_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('recipies_directory')

recipies_directory = RecipiesRepository.new

recipie = recipies_directory.find(1)

puts recipie.id
puts recipie.name
puts recipie.cooking_time
puts recipie.rating