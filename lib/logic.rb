
puts'Logic...'
 def draw_check
    puts '  draw check called'
    state_check if @number_options.size == 1 && @win == ''
    #   @game = false
    #   puts 'draw'
    # end
  end

  def state_check
    puts 'draw'
    @game = false
  end

  def win_check
    puts '  win_check called'
    puts "  active player in win_check is #{@active_player}"
    win_line = [[@arr[0], @arr[1], @arr[2]], [@arr[3], @arr[4], @arr[5]],
                [@arr[6], @arr[7], @arr[8]], [@arr[0], @arr[3], @arr[6]],
                [@arr[1], @arr[4], @arr[7]], [@arr[0], @arr[4], @arr[8]],
                [@arr[2], @arr[5], @arr[8]], [@arr[2], @arr[4], @arr[6]]]
    if @active_player == @player1_name
      win_line.each do |item|
        if item.all?(@marks[1])
          @game = false
          @win = "  #{@player2_name} wins"
        end
      end
    else
      win_line.each do |item|
        if item.all?(@marks[0])
          @game = false
          @win = "  #{@player1_name} wins"
        end
      end
    end
    puts @win
  end
