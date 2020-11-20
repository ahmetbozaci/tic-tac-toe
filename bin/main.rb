#!/usr/bin/env ruby
require_relative '../lib/player.rb'
require_relative '../lib/operations.rb'

# Dislay Tic Tac Toe Table

def game_name
  puts
  puts
  puts create_table
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
  puts
end

# Ask players name and say their symbol
def players_name
  print 'Player one enter your name:  '
  @player1_name = gets.chomp
  player_one = Player.new()
  player_one.name = @player1_name
  user_mark
  player_one.mark = @marks[0]
  puts

  print 'Player two enter your name:  '
  @player2_name = gets.chomp
  player_two = Player.new()
  player_two.name = @player2_name
  player_two.mark = @marks[1]
  puts "#{@player2_name} mark is #{@marks[1]}"
  puts
   sleep(2)
   system('cls')
   system('clear')
   puts create_table
  puts
end

def user_mark
      player1_mark = 'empty'
      loop do
      print 'Please enter either x or o: '
      player1_mark = gets.chomp

    break if ['x', 'X', 'o', 'O'].include?player1_mark
    end
      puts "#{@player1_name} mark is #{player1_mark}"
      if ['x', 'X'].include?player1_mark
        player2_mark = 'O'
      else
        player2_mark = 'X'
      end
      return @marks = [player1_mark, player2_mark]
end

# create table
def create_table

  @table = "
             TİC TAC TOE GAME

   +-----------------------------+
   |         |         |         |
   |    #{@arr[0]}    |    #{@arr[1]}    |    #{@arr[2]}    |
   |         |         |         |
   |-----------------------------|
   |         |         |         |
   |    #{@arr[3]}    |    #{@arr[4]}    |    #{@arr[5]}    |
   |         |         |         |
   |-----------------------------|
   |         |         |         |
   |    #{@arr[6]}    |    #{@arr[7]}    |    #{@arr[8]}    |
   |         |         |         |
   +-----------------------------+
"
end
@game = true
def getnumber
  while @game == true
    print "#{@active_player} enter a number: "
    @active_player_input = gets.chomp
    check_input(@active_player_input.to_i)  
  end
  puts 'Game finished....'
end



game_name
players_name
change_player(@player1_name, @player2_name)
getnumber
