require 'set'

class Dictionary

    ALPHABET = Set.new('a'..'z')

    def initialize
        words = File.readlines('words.txt').map(&:chomp)
        @dictionary = Set.new(words)
    end

    def self.valid?(letter)
        if ALPHABET.include?(letter)
            return true
        else
            puts "invalid fragment"
        end
        return false
    end



end