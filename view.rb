class View
    def display(recipes)
        recipes.each_with_index do |recipe|
            puts "#{recipe.name} #{recipe.description}"
        end 
    end

    def fetch_info
        puts "what is the name?"
        puts "> "
        name = gets.chomp
        
        puts "what is the description?"
        puts "> "
        description = gets.chomp
        {name: name, description: description}
    end

    def index_for_destroy
        puts "what is the index?"
        puts "> "
        index = gets.chomp.to_i
    end
end

