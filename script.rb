#!/usr/bin/env ruby


require_relative "classes/player"
require_relative "classes/game"

system("clear")



puts "Welcome to the game of GHOST"
        puts "----------------------------"
        sleep(1)
        puts "Each player adds a letter to build up a real word."
        puts "Whoever spells an actual word first loses the round and gains a letter to their score."
        puts "Note that you must choose a letter that could spell a real word."
        puts "Whoever's scoreboard spells GHOST first, loses the game."
        puts
        puts "Press ENTER to start game"
        ask = gets
        system("clear")


puts "How many players?"
print "> "
number_of_players = gets.chomp.strip.to_i

names = []
players = []

(0...number_of_players).each do |i|
    system("clear")
    puts "Enter player #{i + 1}'s name"
    print "> "
    name = gets.chomp
    names << name
    player = Player.new(name)
    players << player 
end

system("clear")

def names_to_sentence(names)
    if names.length == 1
        return names[0]
    else
        return names[0..-2].join(', ') + " and " + names[-1]
    end
end


puts "Welcome #{names_to_sentence(names)}!"
print "I'm starting a game for you"
sleep(1)
print "."
sleep(1)
print "."
sleep(1)
print "."
system("clear")



game = Game.new(*players)
game.run






