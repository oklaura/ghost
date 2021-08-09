class Player

    attr_reader :name

    def initialize(name)
        @name = name
    end


    def get_letter
        puts "Add a letter to the word fragment"
        puts "> "
        letter = gets.chomp
        return letter
    end


end


