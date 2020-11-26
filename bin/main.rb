#!/usr/bin/env ruby
require_relative '../lib/player.rb'
require_relative '../lib/game.rb'

# Dislay Tic Tac Toe Table and Rules
def game_start
  game = Game.new("player1","player2","mark1","mark2")
  game.create_table
  puts '
              GAME RULES'
  puts '
  1. THE FIRST PLAYER TO GET 3 OF HER/HIS
  MARKS IN A ROW (UP, DOWN, ACROSS, OR
  DIAGONALLY) IS THE WINNER.'
  puts '
  2. WHEN ALL 9 SQUARES ARE FULL, THE
  GAME IS OVER. IF NO PLAYER HAS 3
  MARKS IN A ROW, THE GAME ENDS IN A TIE.'
  puts
  sleep(2)
  system('cls')
  system('clear')
end
game_start

# Ask players name and mark
def players_name(name)
  puts
  print "#{name} enter your name:  "
  player = gets.chomp.capitalize
end

def user_mark
  mark1 = ''
  loop do
    puts
    print 'Enter your mark "X" or "O":  '
    mark1 = gets.chomp.upcase
    break if %w[X O].include? mark1
  end
  return mark1
end

player1 = Player.new(players_name('Player One'), user_mark)
mark2 = player1.mark == "X" ? "O" : "X"
player2 = Player.new(players_name('Player Two'), mark2)


game = Game.new(player1.name,player2.name,player1.mark,player2.mark)
system('clear')
game.create_table
puts
puts
puts game.getnumber


# def output(content)
#   puts content
# end

# def prompt_player
#   print '  Please type y or n: '
#   user_answer = gets.chomp.to_s
#   if %w[Yes yes Y y].include? user_answer
#     @game = true
#     @win = ''
   
#     @number_options = %w[1 2 3 4 5 6 7 8 9]
#     create_table
#     getnumber
#   elsif %w[No no N n].include? user_answer
#     puts '  Goodbye!'
#   else
#     prompt_player
#   end
# end



# change_player(player1.name, player2.name)

