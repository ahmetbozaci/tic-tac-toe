#!/usr/bin/env ruby
require_relative '../lib/player.rb'
require_relative '../lib/game.rb'

# Dislay Tic Tac Toe Table and Rules
def game_start
  game = Game.new('player1', 'player2', 'mark1', 'mark2')
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

end

first_name_entered = false
def check_nam(word)
  if word.empty?
    print '  Name can not be blank, please enter a name: '
    false
  else
    word.size.times do |i|
      unless ('a'..'z').include? word[i]
        print '  Please enter a proper name:  '
        return false
      end
    end
    true
  end
end

# Ask players name
def players_name(name)
  print "  #{name} enter your name:  "
  nam = ''
  loop do
    nam = gets.chomp
    break if check_nam(nam)
  end
  nam
  first_name_entered = true
end

# Ask mark
def user_mark
  mark1 = ''
  loop do
    print '  Enter your mark "X" or "O":  '
    mark1 = gets.chomp.upcase
    break if %w[X O].include? mark1
  end
  mark1
end

def output(text)
  puts text
end

def prints (text)
  print text
end


player1 = Player.new(players_name('Player One').capitalize, user_mark)
mark2 = player1.mark == 'X' ? 'O' : 'X'
player2 = Player.new(players_name('Player Two').capitalize, mark2)

game = Game.new(player1.name, player2.name, player1.mark, player2.mark)

#game.create_table
game_start
puts
game.getnumber
