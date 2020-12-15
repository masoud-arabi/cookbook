
class Controller
def initializer(cookbook)
    @cookbook = cookbook
    @view = View.new
end

def list
    recipe = @cookbook.all
    @view.display(recipe)
end

def create
    info = @view.fetch_info
    recipe = Recipe.new(info[:name],info[:description])
    @cookbook.add_recipe(recipe)
end

def destroy
end

end