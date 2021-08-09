require 'set'

class Dictionary

    ALPHABET = Set.new('a'..'z')

    def initialize
        words = File.readlines('words.txt').map(&:chomp)
        @dictionary = Set.new(words)
    end

    def self.valid_letter?(letter)
        if ALPHABET.include?(letter)
            return true
        else
            puts "invalid character"
        end
        false
    end

    def valid_fragment?(fragment, letter)
        new_fragment = fragment + letter
        if @dictionary.any? {|word| word.start_with?(new_fragment)}
            return true
        else
            puts "invalid fragment"
        end
        false
    end

    def complete_word?(fragment, letter="")
        if fragment + letter == ""
            return false
        end
        
        new_fragment = fragment + letter
        if @dictionary.include?(new_fragment)
            return true
        else
            return false
        end
    end



end