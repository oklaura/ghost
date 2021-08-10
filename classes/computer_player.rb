require_relative 'game.rb'
require_relative 'dictionary.rb'

class ComputerPlayer

    attr_reader :name

    def initialize
        @name = "Rob the Robot"
    end


    def get_letter(fragment)
        arr = []
        ('a'..'z').each do |letter|
            if Dictionary.include?(fragment + letter)
                arr << letter
            end
        end
        arr.sample
    end


end