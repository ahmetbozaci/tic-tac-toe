#!/usr/bin/env ruby

class Interface

  @@arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  def create_table
    @@table = <<EOM
     =------------------------=
     |   #{@@arr[0]}   |   #{@@arr[1]}    |   #{@@arr[2]}   |
     --------------------------
     |   #{@@arr[3]}   |   #{@@arr[4]}    |   #{@@arr[5]}   |
     --------------------------
     |   #{@@arr[6]}   |   #{@@arr[7]}    |   #{@@arr[8]}   |
     =------------------------=
EOM
  end

  def display
    puts create_table
    puts ''
    puts 'Player one is "O" '
    puts ''
    puts 'Player two is "X" '
    puts ''
  end

  def get_number
    loop do

        puts 'Game finished'
        

        puts 'Player one enter a number:'
        player_one_input = gets.chomp
        update_table(player_one_input.to_i)
        change_player
        puts ''
        puts 'Player two enter a number:'
        player_two_input = gets.chomp
        update_table(player_two_input.to_i)
        change_player

    end
  end

  @@active_player = 'player_one'
  def change_player
    @@active_player = if @@active_player == 'player_one'
                        'player_two'
                      else
                        'player_one'
                      end
  end

  def update_table(num)
    if @@active_player == 'player_one'

      puts "passed number is #{num}"
      puts "array item #{@@arr[num - 1]} will be replaced with O]"
      puts "active player is #{@@active_player}"
      @@arr[num - 1] = 'O'
      puts @@arr
    else
      puts "array item #{@@arr[num - 1]} will be replaced with X]"
      puts "passed number is #{num}"
      puts "active player is #{@@active_player}"
      @@arr[num - 1] = 'X'
      puts @@arr
    end
    puts create_table
  end


end


game = Interface.new
game.display
game.change_player
game.get_number
