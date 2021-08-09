require 'set'

class Dictionary

    ALPHABET = Set.new('a'..'z')

    def initialize
        words = File.readlines('words.txt').map(&:chomp)
        @dictionary = Set.new(words)

    end



end