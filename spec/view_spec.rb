require 'rspec'
require_relative '../game'
require_relative '../view'

describe "View" do
  STATUS = {
    start: "Shall we play a game?",
    draw: "It's a draw... \nThe only winning move is not to play.\nPress 'R' to reset.",
    win: " wins!\nThe only winning move is not to play.\nPress 'R' to reset.",
    bad_move: "Not a valid move. Try again."
  }

  let(:game) { Game.new }
  let(:view) { View.new(game) }

  context "new game" do
    it "should display the board" do
      expect(view.draw_screen).to include(board = "( )|   |   \n-----------\n   |   |   \n-----------\n   |   |   "
      )
    end

    it "should place the cursor in the upper left cell" do
      expect(view.position).to eq 0
    end

  end

  context "attempting a move" do
    before(:each) { view.attempt_position }
    before(:each){ game.make_move(1) }
    p @board

    it "should not allow move to occupied cell" do
      view.move(1,0)
      view.set
      expect(game.number_of_moves).to eq 1
    end

    xit 'should display a piece in the proper position after a move' do
      expect(view.draw_screen).to include(board = "(X)|   |   \n-----------\n   |   |   \n-----------\n   |   |   "
        )
    end
  end

  context "moving the cursor" do
    before(:each){ view.move(1,0) }

    it "should update the cursor position" do
      expect(view.position).to eq 1
    end

  end
end