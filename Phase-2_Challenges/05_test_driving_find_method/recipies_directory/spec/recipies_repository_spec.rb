require 'recipies_repository'

RSpec.describe RecipiesRepository do
    
    def reset_recipies_table
        seed_sql = File.read('spec/seeds_recipies.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'recipies_directory_test' })
        connection.exec(seed_sql)
    end
    
    before(:each) do 
        reset_recipies_table
    end
    
    # 1
    it 'returns all recipies' do
        repo = RecipiesRepository.new

        recipies = repo.all

        expect(recipies.length).to eq(2)

        expect(recipies[0].id).to eq('1') 
        expect(recipies[0].name).to eq('Fried Egg')
        expect(recipies[0].cooking_time).to eq('2')
        expect(recipies[0].rating).to eq('4')
    end

    # 2
    it 'returns the "Fried Egg" recipie' do
        repo = RecipiesRepository.new

        recipies = repo.find(1)

        expect(recipies.id).to eq('1')
        expect(recipies.name).to eq('Fried Egg')
        expect(recipies.cooking_time).to eq('2')
        expect(recipies.rating).to eq('4')
    end

    # 3
    it 'returns the "Toast" recipie' do
        repo = RecipiesRepository.new

        recipies = repo.find(2)

        expect(recipies.id).to eq('2')
        expect(recipies.name).to eq('Toast')
        expect(recipies.cooking_time).to eq('2')
        expect(recipies.rating).to eq('3')
    end
end