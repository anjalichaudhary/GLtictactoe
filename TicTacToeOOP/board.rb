class Board

  def initialize
    @winning_combinations = [ [1,2,3],
                              [4,5,6],
                              [7,8,9],
                              [1,4,7],
                              [2,5,8],
                              [3,6,9],
                              [1,5,9],
                              [3,5,7] ]
    @board = {}
    (1..9).each {|x| @board[x] = x}
    @board
  end


  def draw_board
    puts "_#{@board[1]}_|_#{@board[2]}_|_#{@board[3]}_"
    puts "_#{@board[4]}_|_#{@board[5]}_|_#{@board[6]}_"
    puts " #{@board[7]} | #{@board[8]} | #{@board[9]} "
  end

  def empty_positions
    # return the array indexes for which the value is an integer
    # indicating the position is not chosen by anyone yet
    @board.select {|k,v| v = v.is_a?(Integer) }.keys
  end

  def check_winner player
    @winning_combinations.each do |array|
      return "#{player}" if (@board[array[0]] == "X" && @board[array[1]] == "X" && @board[array[2]] == "X")
      return "Computer" if (@board[array[0]] == "O" && @board[array[1]] == "O" && @board[array[2]] == "O")
    end
    nil
  end

  def player_picks_square
    empty_square = false

    until empty_square
      puts "Pick a square (1-9)"
      position = gets.chomp.to_i
      if position == 0
        puts " Please enter a digit between (1-9)"
      elsif @board[position] != 'X' &&  @board[position] !=  'O'
        @board[position] = 'X'
        empty_square = true
      else
        puts "Sorry, square #{position} is not available. Please try again"
      end
    end
  end

  def computer_picks_square
    position = empty_positions.sample
    puts "Computer chose #{position}"
    @board[position] = 'O'
  end

end