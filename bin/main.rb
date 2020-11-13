#!/usr/bin/env ruby

class Interface
  def initialize 
    @arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  def create_table
    @table = "
     =------------------------=
     |   #{@arr[0]}   |   #{@arr[1]}    |   #{@arr[2]}   |
     --------------------------
     |   #{@arr[3]}   |   #{@arr[4]}    |   #{@arr[5]}   |
     --------------------------
     |   #{@arr[6]}   |   #{@arr[7]}    |   #{@arr[8]}   |
     =------------------------=
"
  end

  def display
    puts create_table
    puts ''
    puts 'Player ONE is "X" '
    puts ''
    puts 'Player TWO is "O" '
    puts ''
  end

  def number
    while @arr.any?(Integer)

      puts 'Player ONE enter a number:'
      player_one_input = gets.chomp
      update_table(player_one_input.to_i)
      change_player
      puts ''
      puts 'Player TWO enter a number:'
      player_two_input = gets.chomp
      update_table(player_two_input.to_i)
      change_player
    end
    puts 'Game finished!'
  end

  @active_player = 'player_one'
  def change_player
    @active_player = if @active_player == 'player_one'
                       'player_two'
                     else
                       'player_one'
                     end
  end

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
game.change_player
game.number
