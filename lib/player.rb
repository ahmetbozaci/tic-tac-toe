require_relative './interface.rb'
class Player < Interface
  # get numbers from players
  @active_player = @player1_name
  def number
    while @count < 10
      print "#{@active_player} enter a number: "
      active_player_input = gets.chomp
      check_input(active_player_input.to_i)
    end
    puts 'Game finished!'
  end

  def check_input(input)
    if @arr.include? input
      system('clear')
      system('cls')
      update_table(input)
      change_player
      puts ''
      @number_options.delete(input)
      @count += 1
    else
      puts
      puts "Please enter a number from #{@number_options}"
      puts
      number
    end
  end

  # change player
  def change_player
    @active_player = if @active_player == @player1_name
                       @player2_name
                     else
                       @player1_name
                     end
  end

  # update table after each player play
  def update_table(num)
    @arr[num - 1] = if @active_player == @player1_name
                      @player1
                    else
                      @player2
                    end
    puts create_table
  end
end
