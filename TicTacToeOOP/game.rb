require_relative './board'

class Game

  def initialize
    puts "What is your name?"
    @name = gets.chomp
  end

  def play_game
    keep_playing = true
    while keep_playing

      @board = Board.new
      @board.draw_board

      begin
        @board.player_picks_square
        winner = @board.check_winner(@name)
        if winner
          @board.draw_board
          break
        end
        @board.computer_picks_square
        @board.draw_board
        winner = @board.check_winner(@name)
      end until winner || @board.empty_positions.empty?
      if winner
        puts "#{winner} won!"
      else
        puts "Game Draw"
      end

      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      if answer != 'y'
        keep_playing = false
      else
        puts "Thank you for keep playing #{@name}."
      end
    end
  end
end
