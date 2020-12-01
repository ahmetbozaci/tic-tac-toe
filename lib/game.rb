require_relative '../lib/player.rb'

class Game
  attr_reader :player1, :player2

  def initialize(player1, player2, mark1, mark2)
    @player1 = player1
    @player2 = player2
    @number_options = %w[1 2 3 4 5 6 7 8 9]
    @arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @game_status = true
    @active_player = player1
    @win = ''
    @mark1 = mark1
    @mark2 = mark2
    @table = ''
  end

  def create_table
    system('cls')
    system('clear')
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
    output(@table)
  end

  def getnumber
    while @game_status == true
      printing("  #{@active_player} enter a number:  ")
      player_input = ask_player
      check_input(player_input)
    end
  end

  def check_input(input)
    input = input.strip
    if @number_options.include? input
      update_table(input)
      win_check
      draw_check
      @number_options.delete(input)
    else
      output(' ')
      prints("  Please enter a number from #{@number_options}")
      output(' ')
    end
  end

  def change_player(player1, player2)
    @active_player = if @active_player == player1
                       player2
                     else
                       player1
                     end
  end

  def update_table(num)
    @arr[num.to_i - 1] = if @active_player == @player2
                           @mark2
                         else
                           @mark1
                         end
    change_player(player1, player2)
    system('clear')
    create_table
  end

  def draw_check
    return unless @number_options.size == 1 && @win == ''

    @game_status = false
    output('  Draw')
    play_again
  end

  def win_lines
    @win_line = [[@arr[0], @arr[1], @arr[2]], [@arr[3], @arr[4], @arr[5]],
                 [@arr[6], @arr[7], @arr[8]], [@arr[0], @arr[3], @arr[6]],
                 [@arr[1], @arr[4], @arr[7]], [@arr[0], @arr[4], @arr[8]],
                 [@arr[2], @arr[5], @arr[8]], [@arr[2], @arr[4], @arr[6]]]
  end

  def win_check
    if @active_player == @player2
      win_lines.each do |item|
        next unless item.all?(@mark1)

        @game_status = false
        @win = "  #{@player1} wins"
        output(@win)
        play_again
      end
    else
      win_lines.each do |item|
        next unless item.all?(@mark2)

        @game_status = false
        @win = "  #{@player2} wins"
        output(@win)
        play_again
      end
    end
  end

  def play_again
    printing '  Would you like to play again?(Y or N): '
    answer = ask_player
    if %w[y Y yes Yes].include? answer
      @game_status = true
      @win = ''
      @number_options = %w[1 2 3 4 5 6 7 8 9]
      @arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      system('clear')
      create_table
      getnumber
    elsif %w[n N no No].include? answer
      @game_status = false
      output '  Game Finished!'
      system('exit!')
    else
      play_again
    end
  end
end
