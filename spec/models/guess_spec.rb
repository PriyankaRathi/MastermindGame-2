require 'spec_helper'

describe Guess do
  describe "#last_guessed_colors" do
    it "should return last guessed color id" do 
      expect(guesses(:guess_a).last_guessed_colors).to eq [2, 2, 2, 1]
    end
  end

  describe "#correct_digits_index" do
    let(:guess) { guesses(:guess_a) }
    subject { guess.correct_digits_index }

    it { expect(subject).to eq [1] }
  end

  describe "Get correct digits count" do
    subject { guess.correct_digits_index.length }

    context "when guessed guess_a" do
      let(:guess) { guesses(:guess_a) }
      it { should eq 1 }
    end

    context "when guessed guess_i" do
      let(:guess) { guesses(:guess_i) }
      it { should eq 2 }
    end
  end
  
  describe "#correct_at_wrong_postion_digit_count" do
    subject { guess.correct_at_wrong_postion_digit_count }

    context "when guessed guess_a" do
      let(:guess) { guesses(:guess_a) }
      it { should eq 1 }
    end

    context "when guessed guess_i" do
      let(:guess) { guesses(:guess_i) }
      it { should eq 1 }
    end
  end

end
