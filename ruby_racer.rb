require_relative 'die.rb'

class RubyRacer
  attr_reader :die, :length
  attr_accessor :players

  def initialize(players, die, length = 30)
    @players = players
    @length = length
    @die = Die.new
  end

  # Returns +true+ if one of the players has reached
  # the finish line, +false+ otherwise
  def finished?
    winner() != nil
  end

  # Returns the winner if there is one, +nil+ otherwise
  def winner
    winner = nil
    @players.each do | player |
      if player[1] == length
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
    if spaces_forward != 0
      puts "#{player[0]} advances #{spaces_forward} #{if spaces_forward == 1; "space"; else; "spaces"; end} forward!"
      if player[1] + spaces_forward > @length
        player[1] = @length
      else
        player[1] += spaces_forward
      end
    else
      puts "Oh no! #{player[0]} fell off their unicycle!"
      puts "#{player[0]} needs to take a break this turn. :("
      sleep(1)
    end
    sleep(1)
  end

  # Returns the current state of the game as a string
  # that can be printed on the command line.
  # The board should have the same dimensions each time.
  def board_visualization
    icon_1 = " O"
    icon_2 = "-(-"
    icon_3 = " |>"
    icon_4 = "(x)"
    line = "*-------------------------------------------------------------|"
    @players.each do | player |
      puts player[0].upcase + ":"
      puts (" " * 2 * player[1]) + icon_1
      puts (" " * 2 * player[1]) + icon_2
      puts (" " * 2 * player[1]) + icon_3
      puts (" " * 2 * player[1]) + icon_4
      puts line
    end
  end
end
