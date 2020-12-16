class Recipe
    attr_reader :name, :description, :rating, :prep_time
    def initialize( name, description, rating, prep_time )
        @name = name
        @description = description
        @rating = rating
        @prep_time = prep_time
        @complete = false
    end

    def complete?
        @complete = true
    end
end

