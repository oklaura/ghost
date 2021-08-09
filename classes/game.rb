require 'set'
require_relative 'player.rb'
require_relative 'dictionary.rb'



class Game

    MAX_LOSSES = 5

    attr_reader :players, :losses, :current_player, :run


    def initialize(*players)
        @players = players
        @losses = {}
        @players.each {|player| losses[player] = 0}
        @current_player = @players[0]
        @fragment = ''
        @dictionary = Dictionary.new
    end

    def run
        introduction
        until game_over? == true
            play_round 
        end
        conclusion
    end

    def play_round

        @fragment = ''
        read_scores

        until @dictionary.complete_word?(@fragment)
        player = @current_player
        letter = player.get_letter
        if Dictionary.valid_letter?(letter) && @dictionary.valid_fragment?(@fragment, letter) && !@dictionary.complete_word?(@fragment, letter)
            add_to_fragment(letter)
        elsif @dictionary.complete_word?(@fragment, letter)
            add_to_fragment(letter)
            update_losses
            return
        else
            return
        end
        puts "Word fragment: " + @fragment
        switch_player
        end
    end

    def add_to_fragment(letter)
        @fragment += letter
        true
    end

    def introduction
        puts "intro"
    end

    def conclusion
        puts "conclusion"
    end

    def switch_player
        @players.rotate!
        @current_player = @players[0]
    end

    def game_over?
        if @players.length == 1
            return true
        else
            return false
        end
    end

    def update_losses
        # losses[@current_player] += 1
        # if losses[@current_player] == MAX_LOSSES
            puts "#{@current_player.name} spelled 'GHOST' and is eliminated from the game"
        # else
        #     puts "#{@current_player.name} loses round and get's a letter. Score: #{spell_ghost(@losses[@current_player])}"
        # end
    end

    def spell_ghost(losses)
        word = "Ghost"
        score = ""
        (0..losses-1).each {|i| score += word[i]}
        score
    end

    def read_scores 
        @losses.each do |k, v|
            puts "#{k.name}: #{spell_ghost(v)}"
        end
    end



end









