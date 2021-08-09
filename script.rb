#!/usr/bin/env ruby


require_relative "classes/player"
require_relative "classes/game"

# system("clear")

# puts "Welcome to the road-trip terminal game GHOST"
# sleep(2)
# system("clear")
# puts "How many players?"
# puts "> "
# number_of_players = gets.chomp.strip.to_i

# names = []
# players = []

# (0...number_of_players).each do |i|
#     system("clear")
#     puts "Enter player #{i + 1}'s name"
#     puts "> "
#     name = gets.chomp
#     names << name
#     player = Player.new(name)
#     players << player 
# end

# system("clear")

# def names_to_sentence(names)
#     if names.length == 1
#         return names[0]
#     else
#         return names[0..-2].join(', ') + " and " + names[-1]
#     end
# end


# puts "Welcome #{names_to_sentence(names)}!"
# print "I'm starting a game for you"
# sleep(1)
# print "."
# sleep(1)
# print "."
# sleep(1)
# print "."

player1 = Player.new("Laura")
player2 = Player.new("Seori")

game = Game.new(player1, player2)
game.run






