require_relative 'recipe'

class Cookbook
    def initialize(csv_file_path)
        @csv_file_path = csv_file_path
        @recipes = []
        load_csv

    end

    def all
        @recipes
    end

    def add_recipe(recipe)
    end
    
    def remove_recipe(recipe_index)
    end
end