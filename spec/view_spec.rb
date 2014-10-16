require 'rspec'
require_relative '../lib/game'
require_relative '../lib/view'

describe "View" do
  STATUS = {
    start: "Shall we play a game?",
    draw: "It's a draw... \nThe only winning move is not to play.\nPress 'R' to reset.",
    win: " wins!\nThe only winning move is not to play.\nPress 'R' to reset.",
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

    it "should not allow move to occupied cell" do
      view.move(1,0)
      view.set
      view.set
      expect(game.number_of_moves).to eq 1
      expect(game.board[1]).to eq 'X'
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