require 'set'
require_relative 'player.rb'
require_relative 'dictionary.rb'



class Game

    MAX_LOSSES = 5
    MAX_TRIES = 3

    attr_reader :players, :losses, :current_player, :run, :dictionary


    def initialize(*players)
        @players = players
        @losses = {}
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
        sleep(1)
        system("clear")

        @fragment = ''

        puts "New Round"
        puts "---------"
        read_scores
        tries = 0

            until Dictionary.complete_word?(@fragment) || tries == MAX_TRIES
                puts "Word fragment: " + @fragment
                puts
                player = @current_player

                #checks if current player is player or computer
                if player.is_a?(ComputerPlayer)
                    letter = player.get_letter(@fragment)
                    add_to_fragment(letter)
                    sleep(1)
                    puts "#{player.name} added an #{letter}!"
                    sleep(1)
                else
                    valid = false
                    until valid == true || tries == MAX_TRIES
                        letter = player.get_letter
                        if Dictionary.valid_letter?(letter) && Dictionary.valid_fragment?(@fragment, letter)
                            valid = true
                            add_to_fragment(letter)
                        else
                            puts "Invalid letter"
                            tries += 1
                            puts tries
                        end
                    end
                end
                puts '--'
                switch_player
            end
        switch_player
        update_losses
        switch_player
        return
    end

    def add_to_fragment(letter)
        @fragment += letter
        true
    end

    def introduction
        
    end

    def conclusion
        sleep(1)
        system("clear")

        puts "GAME OVER"
        winner = @players[0].name
        puts "#{winner} wins!"
        sleep(2)
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
        losses[@current_player] += 1
        if losses[@current_player] == MAX_LOSSES
            system("clear")
            puts "#{@current_player.name} spelled 'GHOST' and is eliminated from the game"
            delete_me = @current_player
            @players.delete(delete_me)
        else
            puts @fragment
            puts "#{@current_player.name} loses round and get's a letter."
            sleep(1)
        end
    end

    def spell_ghost(losses)
        word = "Ghost"
        score = ""
        (0..losses-1).each {|i| score += word[i]}
        score
    end

    def read_scores 
        puts "Scoreboard"
        puts "----------"
        @losses.each do |k, v|
            next if v == 5
            puts "#{k.name}: #{spell_ghost(v)}"
        end
        puts
    end



end









