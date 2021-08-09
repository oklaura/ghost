require 'set'
require_relative 'player.rb'
require_relative 'dictionary.rb'



class Game

    MAX_LOSSES = 5

    attr_reader :players, :losses, :current_player, :run


    def initialize(*players)
        @players = players
        losses = {}
        @players.each {|player| losses[player] = 0}
        @current_player = @players[0]
        @fragment = ''
    end

    def run
        introduction
        until game_over? == true
            play_round 
        end
        conclusion
    end

    def play_round
        player = @current_player
        letter = player.get_letter
        @fragment += letter 
        puts "Word fragment: " + @fragment
        switch_player
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



end


game = Game.new(Player.new('Jordan'), Player.new('Liz'))






