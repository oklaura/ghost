require 'set'

class Dictionary

    ALPHABET = Set.new('a'..'z')

    words = File.readlines('words.txt').map(&:chomp)
    @@dictionary = Set.new(words)

    def self.valid_letter?(letter)
        if ALPHABET.include?(letter)
            return true
        end
        false
    end

    def self.valid_fragment?(fragment, letter)
        new_fragment = fragment + letter
        if @@dictionary.any? {|word| word.start_with?(new_fragment)}
            return true
        end
        false
    end

    def self.complete_word?(fragment="", letter="")
        if fragment + letter == ""
            return false
        end

        new_fragment = fragment + letter
        if @@dictionary.include?(new_fragment)
            return true
        else
            return false
        end
    end

    def self.include?(fragment)
        if @@dictionary.any? {|word| word.start_with?(fragment)}
            return true
        else
            return false
        end
            
    end



end