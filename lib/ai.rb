class AI
  def initialize(game)
    @game = game
    @ai_symbol = game.ai_symbol
    @player_symbol = game.player_symbol
  end

  def make_move(game)
    return if game.over?
    @game.make_move(best_move)
  end

private

  def best_move
    return @game.random_corner if @game.empty?
    if @game.number_of_moves == 1
      @game.center_taken? ? (return @game.random_corner) : (return @game.center)
    else
      predict_move(@game)
      @best_choice
    end
  end

  def predict_move(game)
    return score(game) if game.over?
    moves = {}

    game.empty_cells.each do |cell|
      test_game = game.dup
      test_game.make_move(cell)
      moves[cell] = predict_move(test_game)
    end

    if game.current_turn == @ai_symbol
      max_score = moves.max_by{|cell, score| score }
      @best_choice = max_score[0]
      return max_score[1]
    else
      min_score = moves.min_by{|cell, score| score }
      @best_choice = min_score[0]
      return min_score[1]
    end
  end

  def score(game)
    if game.winner == @ai_symbol
      1
    elsif game.winner == @player_symbol
      -1
    else
      0
    end
  end
end