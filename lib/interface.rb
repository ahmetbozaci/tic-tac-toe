class Interface
  def initialize
    @arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @number_options = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @count = 1
    @player1_name = ''
    @player2_name = ''
    @active_player = ''

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
    system('clear')
    system('cls')
    puts
    puts '              TİC TAC TOE GAME'
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
    sleep(5)
    system('clear')
  end

  # Ask players name and say their symbol
  def players_name
    print 'PLAYER ONE enter your name:  '
    @player1_name = gets.chomp
    puts
    puts "#{@player1_name} plays \"#{@player1}\""
    puts "First player is #{@player1_name}"
    puts
    print 'PLAYER TWO enter your name:  '
    @player2_name = gets.chomp
    puts
    puts "#{@player2_name} plays \"#{@player2}\""
    puts "Second player is #{@player2_name}"
    sleep(1.5)
    system('clear')
    puts '     ---------GAME STARTED---------'
    puts create_table
    puts
  end
end
