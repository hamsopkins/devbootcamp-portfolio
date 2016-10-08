require_relative 'die.rb'

class RubyRacer
  attr_reader :die, :length
  attr_accessor :players

  def initialize(players, die, length = 30)
    @players = [["Player A", 0], ["Player B", 0]]
    @player_a = @players[0]
    @player_b = @players[1]
    @length = length
    @die = Die.new
  end

  # Returns +true+ if one of the players has reached
  # the finish line, +false+ otherwise
  def finished?
    if winner() != nil
      true
    else
      false
    end
  end

  # Returns the winner if there is one, +nil+ otherwise
  def winner
    winner = nil
    @players.each do | player |
      if player[1] >= length
        winner = player[0]
      end
    end
    winner
  end

  # Rolls the die and advances +player+ accordingly
  def advance_player(player)
    puts "#{player[0]}, press return to roll the die."
    wait_for_return = gets.chomp
    spaces_forward = @die.roll
    puts "#{player[0]} advances #{spaces_forward} spaces forward!"
    player[1] += spaces_forward


  end

  # Returns the current state of the game as a string
  # that can be printed on the command line.
  # The board should have the same dimensions each time.
  def board_visualization
    icon_1 = " O"
    icon_2 = "-(-"
    icon_3 = " |>"
    icon_4 = "(x)"
    line = "*----------------------------------------------------------|"

    puts @player_a[0].upcase + ":"
    puts (" " * 2 * @players[0][1]) + icon_1
    puts (" " * 2 * @players[0][1]) + icon_2
    puts (" " * 2 * @players[0][1]) + icon_3
    puts (" " * 2 * @players[0][1]) + icon_4
    puts line
    puts @player_b[0].upcase + ":"
    puts (" " * 2 * @players[1][1]) + icon_1
    puts (" " * 2 * @players[1][1]) + icon_2
    puts (" " * 2 * @players[1][1]) + icon_3
    puts (" " * 2 * @players[1][1]) + icon_4
    puts line


  end
end
