# RECIPIES DIRECTORY Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).

*In this template, we'll use an example table `students`*

*TABLE ALREADY FILLED IN*

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql

-- (file: spec/seeds_recipies.sql)

TRUNCATE TABLE recipies_directory RESTART IDENTITY; -- replace with your own table name.

----------------------------------------------------------------

INSERT INTO recipies_directory (name, cooking_time, rating) VALUES ('Fried Egg', '2', '4');
INSERT INTO recipies_directory (name, cooking_time, rating) VALUES ('Toast', '2', '3');
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 recipies_directory_test < seeds_recipies.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
class Recipies

end


class RecipiesRepository

end
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby

class Recipies

 	attr_accessor :id, :name, :cooking_time, :rating
end

```

*You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.*

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
class RecipiesRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM students;

    # Returns an array of Student objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM students WHERE id = $1;

    # Returns a single Student object.
  end

  # Add more methods below for each operation you'd like to implement.

  # def create(student)
  # end

  # def update(student)
  # end

  # def delete(student)
  # end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby

# Get all recipies

repo = RecipiesRepository.new

recipies = repo.all

reipies.length # =>  2

recipies[0].id # =>  1
recipies[0].name # =>  'Fried Egg'
recipies[0].cooking_time # =>  2
recipies[0].rating # =>  4

# 2
# Return the 'Fried Egg' recipie

repo = RecipiesRepository.new

recipies = repo.find(1)

recipies.id # =>  1
recipies.name # =>  'Fried Egg'
recipies.cooking_time # =>  2
recipies.rating # =>  4

# 3
# Return the 'Toast' recipie

repo = RecipiesRepository.new

recipies = repo.find(2)

recipies.id # =>  2
recipies.name # =>  'Toast'
recipies.cooking_time # =>  2
recipies.rating # =>  3

# Add more examples for each method
```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_recipies_table
  seed_sql = File.read('spec/seeds_recipies.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipies_directory_test' })
  connection.exec(seed_sql)
end

describe RecipiesRepository do
  before(:each) do 
    reset_recipies_table
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
