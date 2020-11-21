require_relative './logic.rb'
# get numbers from players
@number_options = [1, 2, 3, 4, 5, 6, 7, 8, 9]
@arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]

def check_input(input)
  if @number_options.include? input
    update_table(input)
    win_check
    draw_check
    @number_options.delete(input)
  else
    output("  Please enter a number from #{@number_options}")
  end
end

def change_player(aaa, bbb)
  @active_player = if @active_player == aaa
                     bbb
                   else
                     aaa
                   end
end

# update table after each player play
def update_table(num)
  @arr[num - 1] = if @active_player == @player2_name
                    @marks[1]
                  else
                    @marks[0]
                  end
  change_player(@player1_name, @player2_name)
  create_table
end
