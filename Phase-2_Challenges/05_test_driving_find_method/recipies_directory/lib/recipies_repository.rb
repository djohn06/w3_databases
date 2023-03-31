require_relative './recipies'

class RecipiesRepository
    def all
        recipies = []

        sql = 'SELECT id, name, cooking_time, rating FROM recipies;'
        result_set = DatabaseConnection.exec_params(sql, [])

        result_set.each do |record|
            recipie = Recipies.new

            recipie.id = record['id']
            recipie.name = record['name']
            recipie.cooking_time = record['cooking_time']
            recipie.rating = record['rating']

            recipies << recipie
        end

        return recipies
    end
  
    def find(id)
        sql = 'SELECT id, name, cooking_time, rating FROM recipies WHERE id = $1;'
        sql_params = [id]

        result_set = DatabaseConnection.exec_params(sql, sql_params)
        record = result_set[0]

        recipie = Recipies.new
        recipie.id = record['id']
        recipie.name = record['name']
        recipie.cooking_time = record['cooking_time']
        recipie.rating = record['rating']

        return recipie
    end
end