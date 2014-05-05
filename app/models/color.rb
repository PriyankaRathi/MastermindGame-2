class Color < ActiveRecord::Base
  has_many :game_colors
  has_many :games, :through => :game_colors
  has_many :guessed_colors
  has_many :guess, :through => :guessed_colors

  validates :color_name, :presence => true, :format => { :with => /\A[a-zA-Z]+\Z/ }

  def self.all_colors
    Color.select("id").map(&:id)
  end

  def self.color_image_name_from_color_id color
    color_image = Color.find(color.to_i).color_name 
    color_image.include?(".jpg") ? color_image : color_image << ".jpg"
  end

  def self.color_scheme_range
    max_range = [8, Color.count].min
  end

end
