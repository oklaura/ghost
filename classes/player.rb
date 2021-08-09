class Player

    attr_reader :name

    def initialize(name)
        @name = name
    end


    def get_letter
        puts "#{self.name}'s turn! Add a letter to the word fragment"
        print "> "
        letter = gets.chomp.downcase
        return letter
    end


end


