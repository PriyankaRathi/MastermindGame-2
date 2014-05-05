require 'spec_helper'

describe Guess do
  describe "#last_guessed_colors" do
    let(:guess) { guesses(:guess_a) }
    subject { guess.last_guessed_colors }

    it { expect(subject).to eq [2, 2, 2, 1] }
  end

  describe "#target_game_colors" do
    let(:guess) { guesses(:guess_a) }
    subject { guess.target_game_colors }

    it { expect(subject).to eq [1, 2, 3, 4] }
  end

  describe "#correct_digits_index" do
    let(:guess) { guesses(:guess_a) }
    subject { guess.correct_digits_index }

    it { expect(subject).to eq [1] }
  end

  describe "#correct_digits_count" do
    subject { guess.correct_digits_count }

    context "when guessed guess_a" do
      let(:guess) { guesses(:guess_a) }
      it { expect(subject).to eq 1 }
    end

    context "when guessed guess_i" do
      let(:guess) { guesses(:guess_i) }
      it { expect(subject).to eq 2 }
    end
  end
  
  describe "#correct_at_wrong_postion_digit_count" do
    before { guess.correct_digits_count }
    subject { guess.correct_at_wrong_postion_digit_count }

    context "when guessed guess_a" do
      let(:guess) { guesses(:guess_a) }
      it { expect(subject).to eq 1 }
    end

    context "when guessed guess_i" do
      let(:guess) { guesses(:guess_i) }
      it { expect(subject).to eq 1 }
    end
  end

end
