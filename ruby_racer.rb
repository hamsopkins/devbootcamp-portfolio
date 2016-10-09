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
      if player[:position] == length
        winner = player[:name]
      end
    end
    winner
  end

  # Rolls the die and advances +player+ accordingly
  def advance_player(player)
    puts "#{player[:name]}, press return to roll the die."
    wait_for_return = gets.chomp
    spaces_forward = @die.roll
    if spaces_forward != 0
      player[:fell] = false
      puts "#{player[:name]} advances #{spaces_forward} space#{unless spaces_forward == 1; "s"; end} forward!"
      if player[:position] + spaces_forward > @length
        player[:position] = @length
      else
        player[:position] += spaces_forward
      end
    else
      player[:fell] = true
      puts "Oh no! #{player[:name]} fell off their unicycle!"
      puts "#{player[:name]} needs to take a break this turn. :("
      sleep(1)
    end
    sleep(1)
  end

  # Returns the current state of the game as a string
  # that can be printed on the command line.
  # The board should have the same dimensions each time.
  def board_visualization
    head = " O"
    torso = "-(-"
    legs = " |>"
    wheel = "(x)"
    ground = "*-------------------------------------------------------------|"
    @players.each do | player |
      puts player[:name].upcase + ":"
      if player[:fell]
        3.times { puts("") }
      else
        puts (" " * 2 * player[:position]) + head
        puts (" " * 2 * player[:position]) + torso
        puts (" " * 2 * player[:position]) + legs
      end
      puts (" " * 2 * player[:position]) + wheel
      puts ground
    end
  end
end
