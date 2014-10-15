require 'rspec'
require_relative '../game'

describe "Game" do
  let(:game) { Game.new  }

  context "new game" do

    it "should have an empty board" do
      expect(game.empty?).to be_truthy
    end

    it "should set ai and player symbols" do
      expect(game.ai_symbol).to eq 'O'
      expect(game.player_symbol).to eq 'X'
    end

    it "should allow the player to go first" do
      expect(game.current_turn).to eq 'X'
    end

    it "should not have a winner" do
      expect(game.winner).to be nil
    end

    it "should not be over" do
      expect(game.over?).to be_falsey
    end
  end

  context "make a move" do
    it "should allow for a move in an open cell" do
      expect(game.make_move(4)).to be_truthy
    end
    it "should not allow for a move to an occupied cell" do
      game.make_move(4)
      expect(game.make_move(4)).to be_falsey
      expect(game.board[4]).to eq 'X'
    end
    it "should alternate between players" do
      game.make_move(4)
      game.make_move(5)
      expect(game.board[4]).to eq 'X'
      expect(game.board[5]).to eq 'O'
    end
    it "should indicate if the center spot is taken" do
      expect(game.center_taken?).to be_falsey
      game.make_move(4)
      expect(game.center_taken?).to be_truthy
    end
  end
end