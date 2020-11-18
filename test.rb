class Interface
  def initialize
    @arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @number_options = [1, 2, 3, 4, 5, 6, 7, 8, 9]

    @active_player = ''
    # Give random "x" or "o" to players
    game_arr = %w[X O]
    @player1_mark = game_arr.sample
    @player2_mark = if @player1_mark == game_arr[0]
                      game_arr[1]
                    else
                      game_arr[0]
                    end
    @game = true
    @player1_name = ''
    @player2_name = ''
    @win = ''
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
    # puts "
    #             GAME RULES"
    # puts "
    # 1. The first player to get 3 of her/his
    # marks in a row (up, down, across, or
    # diagonally) is the winner."
    # puts "
    # 2. When all 9 squares are full, the
    # game is over. If no player has 3
    # marks in a row, the game ends in a tie."
  end

  # Ask players name and say their symbol
  def players_name
    print 'PLAYER ONE write your name:  '
    @player1_name = gets.chomp
    puts
    print "#{@player1_name}, your mark is \"#{@player1_mark}\""
    print 'PLAYER TWO write your name:  '
    @player2_name = gets.chomp
    puts
    print "#{@player2_name}, your mark is \"#{@player2_mark}\""
    # sleep(2)
    # system('clear')
    puts create_table
    puts
  end

  def getnumber
    while @game == true
      print "#{@active_player} enter a number: "
      active_player_input = gets.chomp
      check_input(active_player_input.to_i)
    end
  end

  def check_input(input)
    if @arr.include? input
      # system('clear')
      # system('cls')
      update_table(input)
      win_check
      draw_check
      change_player
      puts ''
      @number_options.delete(input)
    else
      puts
      puts "Please enter a number from #{@number_options}"
      puts
      getnumber
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
                      @player1_mark
                    else
                      @player2_mark
                    end
    puts create_table
  end

  def draw_check
    state if @number_options.size == 1 && @win == ''
    #   @game = false
    #   puts 'draw'
    # end
  end

  def state
    puts 'draw'
    @game = false
  end

  def win_check
    win_line = [[@arr[0], @arr[1], @arr[2]], [@arr[3], @arr[4], @arr[5]],
                [@arr[6], @arr[7], @arr[8]], [@arr[0], @arr[3], @arr[6]],
                [@arr[1], @arr[4], @arr[7]], [@arr[0], @arr[4], @arr[8]],
                [@arr[2], @arr[5], @arr[8]], [@arr[2], @arr[4], @arr[6]]]
    if @active_player == @player1_name
      win_line.each do |item|
        if item.all?(@player1_mark)
          @game = false
          @win = "#{@player1_name} win"
        end
      end
    else
      win_line.each do |item|
        if item.all?(@player2_mark)
          @game = false
          @win = "#{@player2_name} win"
        end
      end
    end
    puts @win
  end
end
interface = Interface.new
interface.display
interface.players_name
interface.change_player
interface.getnumber
