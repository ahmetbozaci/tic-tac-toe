#!/usr/bin/env ruby

class Interface

  @@arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  @@table = <<EOM
   =------------------------=
   |   #{@@arr[0]}   |   #{@@arr[1]}    |   #{@@arr[2]}   |
   --------------------------
   |   #{@@arr[3]}   |   #{@@arr[4]}    |   #{@@arr[5]}   |
   --------------------------
   |   #{@@arr[6]}   |   #{@@arr[7]}    |   #{@@arr[8]}   |
   =------------------------=
EOM

  
  def display
    puts @@table
    puts ""
    puts 'Player one is "O" '
    puts ""
    puts 'Player two is "X" '
    puts ""
  end
 
  def get_number
    puts 'Player one enter a number:'
    player_one_input = gets.chomp.to_i
    update_table(player_one_input)
    puts @@table
    puts ""
    puts 'Player two enter a number:'
    player_two_input = gets.chomp.to_i
    update_table(player_two_input)
    puts @@table
  end
  
  @@active_player = "player_one"
  def change_player
    if @@active_player == "player_one"
      @@active_player = "player_two"
    else
      @@active_player = "player_one"
    end
  end

  def update_table(num)
   
      if @@active_player == "player_one"
        @@arr[num-1] = "O"
      else
        @@arr[num-1] = "X"
      end
  end




end
  
  game = Interface.new

  game.display
  game.change_player
  game.get_number
  game.display

