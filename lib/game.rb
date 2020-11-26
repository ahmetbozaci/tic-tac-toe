
require_relative '../lib/player.rb'
# get numbers from players

class Game
  attr_reader :player_1, :player_2
  
  def initialize(player_1, player_2, mark_1, mark_2)
    @player_1 = player_1
    @player_2 = player_2
    @number_options = %w[1 2 3 4 5 6 7 8 9]
    @arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @game_status = true
    @active_player = player_1
    @win = ''
    @mark_1 = mark_1
    @mark_2 = mark_2
  end

  def create_table
    puts @table = "
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

  def getnumber
    while @game_status == true
      print "#{@active_player} enter a number:  "
      player_input = gets.chomp
      check_input(player_input)
    # puts '  Would you like to play again?'
    # prompt_player
    end
  end
  
  # check numbers if not valid and update table if valid
  def check_input(input)
    input = input.strip
    if @number_options.include? input
      update_table(input)
      win_check
      draw_check
      @number_options.delete(input)
    else
      puts "Please enter a number from #{@number_options}"
    end
  end

  #change player 
  def change_player(player1, player2)
    @active_player = if @active_player == player1
                      player2
                    else
                      player1
                    end
  end

  # update table 
  def update_table(num)
    @arr[num.to_i - 1] = if @active_player == @player_2
                          @mark_2
                        else
                          @mark_1
                        end
    change_player(player_1, player_2)
    system('clear')
    puts create_table
 
  end


  def draw_check
    return unless @number_options.size == 1 && @win == ''
    @game_status = false
    puts "draw"
  end

  # if move is win show player name and say win
  def win_check
    @win_line = [[@arr[0], @arr[1], @arr[2]], [@arr[3], @arr[4], @arr[5]],
    [@arr[6], @arr[7], @arr[8]], [@arr[0], @arr[3], @arr[6]],
    [@arr[1], @arr[4], @arr[7]], [@arr[0], @arr[4], @arr[8]],
    [@arr[2], @arr[5], @arr[8]], [@arr[2], @arr[4], @arr[6]]]

    if @active_player == @player_2
      
      @win_line.each do |item|
     
        if item.all?(@mark_1)

        
          @game_status = false
          @win = "#{@player_1} wins"
        end
      end
    else
    
      @win_line.each do |item|
        if item.all?(@mark_2)
       
          @game_status = false
          @win = "#{@player_2} wins"
        end
      end
    end
    puts @win
  end
  
end

