#!/usr/bin/env ruby

class Interface
  def initialize
    @arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]

    # Give random "x" or "o" to players
    game_arr = %w[X O]
    @player1 = game_arr.sample
    @player2 = if @player1 == game_arr[0]
                 game_arr[1]
               else
                 game_arr[0]
               end
  end

  def create_table
    @table = "
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

  # Dislay Tic Tac Toe Table
  def display
    puts
    puts
    puts '              TİC TAC TOE GAME'
    puts create_table
    puts
    puts "
                GAME RULES"
    puts "
    1. The first player to get 3 of her/his
    marks in a row (up, down, across, or
    diagonally) is the winner."
    puts "
    2. When all 9 squares are full, the
    game is over. If no player has 3
    marks in a row, the game ends in a tie."
    puts
    puts
  end

  # Ask players name and say their symbol
  def players_name
    print 'PLAYER ONE write your name:  '
    @player1_name = gets.chomp
    puts
    print "#{@player1_name} is \"#{@player1}\""
    puts
    puts
    print 'PLAYER TWO write your name:  '
    @player2_name = gets.chomp
    puts
    print "#{@player2_name} is \"#{@player2}\""
    puts
    puts
    puts '---------GAME STARTED---------'
  end

  # get numbers from players
  def number
    while @arr.any?(Integer)
      puts
      print "#{@player1_name} enter a number: "
      player_one_input = gets.chomp
      update_table(player_one_input.to_i)
      change_player
      puts ''
      print "#{@player2_name} enter a number: "
      player_two_input = gets.chomp
      update_table(player_two_input.to_i)
      change_player
    end
    puts 'Game finished!'
  end

  # change player
  @active_player = 'player_one'
  def change_player
    @active_player = if @active_player == 'player_one'
                       'player_two'
                     else
                       'player_one'
                     end
  end

  # update table after each player play
  def update_table(num)
    @arr[num - 1] = if @active_player == 'player_one'
                      'O'
                    else
                      'X'
                    end
    puts create_table
  end
end

game = Interface.new
game.display
game.players_name
game.change_player
game.number
