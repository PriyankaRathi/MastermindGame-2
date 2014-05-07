require 'spec_helper'

describe Game do
  describe "#won?"  do
    subject { game.won? }

    context "when entered incorrect guess" do
      let(:game) { games(:game1) }
      it { should be false }
    end
    
    context "when entered correct guess" do
      let(:game) { games(:game2) }
      it { should be true }
    end
  end

  describe "#latest_guess" do 
    it "should return last guess" do
      expect(games(:game1).latest_guess).to eq guesses(:guess_b)
    end
  end

  describe "#lost?" do
    subject { game.lost? }
    context "When not out of guesses" do
      let(:game) { games(:game1) }
      it { should be false }
    end

    context "When out of guesses" do
      let(:game) { games(:game3) }
      it { should be true }
    end
  end

  describe "#guesses_left" do
    it "should return guesses left" do
      expect(games(:game2).guesses_left).to eq 2
    end
  end

  describe "#pick_target_game_colors" do
    subject { game.pick_target_game_colors }

    shared_examples_for "all target number" do
      it "should return numeric array" do
        expect(subject.length) == game.color_code_length
        expect(is_valid_number?(subject)).to be true
      end
    end
    
    context "when duplicates allowed" do
      let(:game) { games(:game2) }
      it_should_behave_like "all target number"
    end

    context "when duplicates not allowed" do
      let(:game) { games(:game1) }
      it { expect(is_duplicate?(subject)).to be true }
      it_should_behave_like "all target number"
    end
  end

  describe "#target_game_colors" do
    it "should return target color id" do
      expect(games(:game1).target_game_colors).to eq [1, 2, 3, 4]
    end
  end
end
