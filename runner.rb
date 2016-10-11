require_relative 'die'
require_relative 'ruby_racer'
require_relative 'reset_screen'
require 'artii'

players = []
die = Die.new


# Clear the screen and print the board
# with players in their starting positions.
# Then pause, so users can see the starting board.

reset_screen
puts "Welcome to RubyRacer!"
puts "Get on your unicycles, folks!"
puts "Please enter the number of users (2-5 allowed):"

number_of_users = gets.chomp.to_i
unless (2..5).include?(number_of_users)
  until (2..5).include?(number_of_users)
    puts "Invalid input. Number of allowed users can only be 2-5."
    puts "Please enter the number of users:"
    number_of_users = gets.chomp.to_i
  end
end

number_of_users.times do | n |
  puts "Player #{n + 1}, please enter your name:"
  players << { name: gets.chomp, position: 0, fell: false }
end
puts "Do you want to run in auto mode? (y/n)"
if_auto_mode_input = gets.chomp
unless if_auto_mode_input.downcase == "y" || if_auto_mode_input.downcase == "n"
  until if_auto_mode_input.downcase == "y" || if_auto_mode_input.downcase == "n"
    puts "Please try again. Enter y or n."
    if_auto_mode_input = gets.chomp
  end
end
if if_auto_mode_input.downcase == "y"
  params = { auto_mode: true }
else
  params = { auto_mode: false}
end

game = RubyRacer.new(players, die, params)
system "clear"
game.board_visualization
sleep(1)

# Play the game.
until game.finished?
  # Do this each round until the game is finished.
  # Move each player forward.
  game.players.each do |player|
    game.advance_player(player)
    system "clear"
    game.board_visualization
    break if game.finished?
  end

  # Now that each player has moved,
  # reprint the board with the new player positions
  # and pause so users can see the updated board.
  reset_screen
  game.board_visualization
  sleep(0.2)
end

# Once the game is finished, report the winner.
artify = Artii::Base.new :font => 'slant'

puts artify.asciify("#{game.winner} wins!")
