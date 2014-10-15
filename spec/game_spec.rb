require 'rspec'

require_relative '../game'
require_relative '../ai'

describe "Game" do
  describe "new game" do
    let(:game) { Game.new  }

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
  end
end

# describe "AI" do
#   describe 'next turn' do
#     let(:game){ Game.new }
#     let(:computer){ AI.new }
#     it "should choose corner if available" do
#       expect(game.best_move).to eq 0 || 2 || 6 || 8
#     end
#   end
# end