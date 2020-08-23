def check_winner board, player
  winning_combinations = [ [1,2,3],
                    [4,5,6],
                    [7,8,9],
                    [1,4,7],
                    [2,5,8],
                    [3,6,9],
                    [1,5,9],
                    [3,5,7] ]

  winning_combinations.each do |array|
    return "#{player}" if (board[array[0]] == "X" && board[array[1]] == "X" && board[array[2]] == "X")
    return "Computer" if (board[array[0]] == "O" && board[array[1]] == "O" && board[array[2]] == "O")
  end
  nil
end

def initialize_board
  board = {}
  (1..9).each {|x| board[x] = x}
  board
end

def draw_board(board)
  system 'cls'
  puts "_#{board[1]}_|_#{board[2]}_|_#{board[3]}_"
  puts "_#{board[4]}_|_#{board[5]}_|_#{board[6]}_"
  puts " #{board[7]} | #{board[8]} | #{board[9]} "
end

def player_picks_square(board)
  empty_square = false

  until empty_square
    puts "Pick a square (1-9)"
    position = gets.chomp.to_i
    if board[position] != 'X' &&  board[position] !=  'O'
      board[position] = 'X'
      empty_square = true
    else
      puts "Sorry, square #{position} is not available. Please try again"
    end
  end
end

def empty_positions(board)
  #returns an array of keys which represent the available positions on the game board
  board.select {|k,v| v = v.is_a?(Integer) }.keys
end


def computer_picks_square(board)
  position = empty_positions(board).sample
  puts "Computer chose #{position}"
  board[position] = 'O'
end


#main program
puts "What is your name?"
name = gets.chomp

keep_playing = true

while keep_playing

  @board = initialize_board
  draw_board @board

  begin
    player_picks_square @board
    winner = check_winner @board, name
    if winner
      draw_board @board
      break
    end
    computer_picks_square @board
    draw_board @board
    winner = check_winner @board, name
  end until winner || empty_positions(@board).empty?
  if winner
    puts "#{winner} won!"
  else
    puts "Game Draw!!!"
  end

  puts "Would you like to play again? (y/n)"
  answer = gets.chomp
  if answer != 'y'
    keep_playing = false
  else
    puts "Thank you for keep playing #{name}."
  end
end