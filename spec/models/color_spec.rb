require 'spec_helper'

describe Color do
  describe ".color_image_name_from_color_id" do
    let(:color) { "1" }
    subject { Color.color_image_name_from_color_id(color) }
    it { expect(subject).to eq 'Red.jpg' }
  end

  describe ".color_scheme_range" do
    subject { Color.color_scheme_range }
    it { expect(subject).to eq 5 }
  end

  describe ".all_colors" do
    subject { Color.all_colors }
    it { expect(subject).to eq [1, 2, 3, 4, 5] }
  end
end
