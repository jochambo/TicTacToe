class Game
  LINES  = [[0,1,2], [3,4,5],
            [6,7,8], [0,3,6],
            [1,4,7], [2,5,8],
            [0,4,8], [2,4,6]]

  attr_reader :ai_symbol, :player_symbol, :empty_cells, :current_turn, :winner, :board

  def initialize
    @board = Array.new(9)
    @empty_cells = (0..8).to_a
    @ai_symbol, @player_symbol = ai_symbol, player_symbol
    @current_turn = @player_symbol
    @winner = nil
  end

  def make_move(cell)
    return false unless @empty_cells.include?(cell) && !over?
    @board[cell] = @current_turn
    @empty_cells.delete(cell)
    @current_turn = next_turn
    check_for_winner
  end

  def ai_symbol
    'O'
  end

  def player_symbol
    'X'
  end

  def valid_position?(cell)
    @empty_cells.include?(cell)
  end

  def empty?
    empty_cells.size == 9
  end

  def over?
    !!@winner || empty_cells.empty?
  end

  def number_of_moves
    @board.size - @empty_cells.size
  end

  def random_corner
    [0, 2, 6, 8].sample
  end

  def center
    4
  end

  def center_taken?
    @board[4] != nil
  end

private

  def next_turn
    @current_turn == @ai_symbol ? @player_symbol : @ai_symbol
  end

  def check_for_winner
    LINES.each do |line|
      @winner = @board[line[0]] if winning_line?(line)
    end
  end

  def winning_line?(line)
    values = line.map { |position| @board[position] }
    values.uniq.size == 1 && values[0] != nil
  end

  def initialize_copy(source)
    empty_cells = @empty_cells.map {|cell| cell }
    board = @board.map {|cell| cell }
    current_turn = @current_turn
    super
    @current_turn = current_turn
    @empty_cells = empty_cells
    @board = board
  end
end