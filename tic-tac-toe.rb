WINNING_COMBOS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
].freeze

class Game
  def initialize
    @board = Array.new(9, " ")
    @current_player, @other_player = "X", "O"
    @winner = nil
    @has_ended = false
  end

  def valid_input?(input)
    input =~ /\A[0-8]\z/
  end

  def get_input
    print "\nEnter a position (0-8): "
    position = gets.chomp

    unless valid_input?(position)
      print "\nInvalid input '#{position}', please try again\n"
      draw_current_board
      return get_input
    end

    position = position.to_i

    if @board[position] == @other_player
      print "\nThat position is already taken. Please choose another position\n"
      draw_current_board
      return get_input
    end

    position
  end

  def run_game
    until @has_ended
      has_won = check_for_win(@other_player)
      has_drawn = check_for_draw

      declare_win(@other_player) if has_won

      declare_draw if has_drawn

      play unless has_won || has_drawn
    end
  end

  def play
    print "\nIt is #{@current_player}'s turn, pick a position from 0 - 8 \n"
    draw_current_board
    position = get_input
    @board[position] = @current_player
    @current_player, @other_player = @other_player, @current_player
    draw_current_board
  end

  def declare_win(player)
    print "\nPlayer #{player} has won!"
    @winner = player
    @has_ended = true
  end

  def declare_draw
    print "\nIt's a draw!"
    @has_ended = true
  end

  def draw_current_board
    print "\n-------------\n"
    @board.each_with_index do |value, index|
      print "| " if (index % 3).zero?

      print "#{value.nil? ? ' ' : value} | "

      print "\n-------------\n" if ((index + 1) % 3).zero?
    end
  end

  def check_for_win(player)
    WINNING_COMBOS.any? { |combo| combo.all? { |pos| @board[pos] == player } }
  end

  def check_for_draw
    @board.all? { |value| value != " " }
  end
end

game = Game.new
game.run_game