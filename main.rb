class Interface
  arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  @@table = <<EOM
 =------------------------=
 |   #{arr[0]}   |   #{arr[1]}    |   #{arr[2]}   |
 --------------------------
 |   #{arr[3]}   |   #{arr[4]}    |   #{arr[5]}   |
 --------------------------
 |   #{arr[6]}   |   #{arr[7]}    |   #{arr[8]}   |
 =------------------------=
EOM

  puts @@table
  puts 'Player one plays O'
  puts 'Player two plays X'

  puts ''
  puts 'Player one enter a number:'
  #player_one_input = gets.chomp

  puts 'Player two enter a number:'
  #player_two_input = gets.chomp
end



 
