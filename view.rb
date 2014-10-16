class View

  BOARD = " X | X | X \n-----------\n X | X | X \n-----------\n X | X | X "
  STATUS = {
    start: "Shall we play a game?",
    draw: "It's a draw... \nThe only winning move is not to play.\nPress 'R' to reset.",
    win: " wins!\nThe only winning move is not to play.\nPress 'R' to reset.",
    bad_move: "Not a valid move. Try again."
  }

  attr_reader :position, :status

  def initialize(game)
    @game = game
    @position = 0
  end

  def draw_screen
    [draw_board, status_line, position_line, instructions].join("\n")
  end

  def view_status

  end

  def move(x,y)
    x = (@position + x) % 3
    y = ((@position / 3) + y) % 3
    @position = x + (y * 3)
  end

  def attempt_position
    if @game.valid_position?(@position)
      set_position
    else
      @status = STATUS[:bad_move]
    end
  end

  def set
    @game.make_move(@position)
  end

  private

  def draw_board
    index = -1
    BOARD.gsub(" X ") do
      index += 1
      field = @game.board[index] ? @game.board[index] : " "
      @position == index ? "(#{field})" : " #{field} "
    end
  end

  def instructions
    "Q = Quit | R = Reset \nArrow Keys = Move | Return = Play"
  end

  def position_line
    "Position: #{@position + 1}"
  end

  def status_line
    if @game.winner
      "'#{@game.winner}'" + STATUS[:win]
    elsif @game.over?
      STATUS[:draw]
    else
      "Let's play!"
    end
  end
end