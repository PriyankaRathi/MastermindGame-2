require 'spec_helper'

describe Color do
  describe ".color_image_name_from_color_id" do
    it "should return color image name" do
      expect(Color.color_image_name_from_color_id(1)).to eq 'Red.jpg'
    end
  end

  describe ".color_scheme_range" do
    it "should return max color code length allowed" do 
      expect(Color.color_scheme_range).to eq 5 
    end
  end

  describe ".all_colors" do
    it "should return all color ids" do
      expect(Color.all_colors).to eq [1, 2, 3, 4, 5] 
    end
  end
end
