require_relative 'view'
require_relative 'recipe'
require 'nokogiri'
require 'open-uri'

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
        recipe = Recipe.new(info[:name], info[:description], info[:rating], info[:prep_time])
        @cookbook.add_recipe(recipe)
    end

    def destroy
        index = @view.index_for_destroy
        @cookbook.remove_recipe(index)

    end
    
    def mark_recipe_as_complete
        index = @view.index_for_destroy
        recipe = @cookbook.find(index)
        recipe.complete!
    end

    def unmark_recipe_as_uncomplete
        index = @view.index_for_destroy
        recipe = @cookbook.find(index)
        recipe.uncomplete!
    end

    def fetch_url
        selected_recipe = @view.word_for_recipe
        url = "exit#{selected_recipe}"
        html = open(url).read
        doc = Nokogiri::HTML(html)
        name_url = doc.search(".fixed-recipe-card__title-link span")# recipe = Recipe.new(info[:title], info[:description])
        number = @view.ask_user_number_url(name_url)
        description = doc.search(".fixed-recipe-card__description")
        rating = doc.search(".stars")
        urls = doc.search(".fixed-recipe-card__info a")
        special_url = urls[number].attribute('href').value
        # Get the html file
        special_html = open(special_url).read
        # file = ".html" # or 'strawberry.html'
        special_doc = Nokogiri::HTML(special_html)
        prep_time = special_doc.search(".recipe-meta-item-body")
        recipe = Recipe.new(name_url[number].text.strip, description[number].text.strip, rating[number].attribute("data-ratingstars").value.to_i, prep_time.first.text.strip)
        @cookbook.add_recipe(recipe)
    end

end