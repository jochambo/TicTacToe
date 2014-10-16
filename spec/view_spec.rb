require 'rspec'
require_relative '../game'
require_relative '../view'

describe "View" do
  STATUS = {
    start: "Let's play!",
    draw: "It's a draw... Press 'R' to reset.",
    win: " wins! Press 'R' to reset.",
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

    it "should update the status to bad move" do
      view.attempt_position
      expect(view_status).to eq STATUS[:bad_move]
    end

    it 'should display a piece in the proper position after a move' do
      expect(view.draw_screen).to include(board = "(X)|   |   \n-----------\n   |   |   \n-----------\n   |   |   "
        )
    end
  end
end