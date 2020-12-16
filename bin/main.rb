require_relative '../lib/player.rb'
require_relative '../lib/game.rb'

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

@first_name_entered = false
def check_nam(word)
  if word.empty?
    print '  Name can not be blank, please enter a name: '
    false
  else
    word.size.times do |i|
      unless ('a'..'z').cover? word[i].downcase
        print '  Please enter a proper name: '
        return false
      end
    end
    if @first_name_entered == true && word.casecmp(@first_name.downcase).zero?
      print '  This name is already taken, please enter a different name: '
      return false
    else
      @first_name = word
    end
    @first_name_entered = true
    true
  end
end

def players_name(name)
  print "  #{name} enter your name:  "
  nam = ''
  loop do
    nam = gets.chomp
    break if check_nam(nam)
  end
  nam
end

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

def printing(text)
  print text
end

def ask_player
  ask = gets.chomp
  ask
end
game_start
player1 = Player.new(players_name('Player One').capitalize, user_mark)
mark2 = player1.mark == 'X' ? 'O' : 'X'
player2 = Player.new(players_name('Player Two').capitalize, mark2)
system('cls')
system('clear')
game = Game.new(player1.name, player2.name, player1.mark, player2.mark)

game.create_table

puts
game.getnumber
