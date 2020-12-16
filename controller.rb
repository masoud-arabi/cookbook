require_relative 'view'
require_relative 'recipe'

class Controller
def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
end

def list
    recipe = @cookbook.all
    @view.display(recipe)
end

def create
    info = @view.fetch_info
    recipe = Recipe.new(info[:name], info[:description])
    @cookbook.add_recipe(recipe)
end

def destroy
    index = @view.index_for_destroy
    @cookbook.remove_recipe(index)

end

end