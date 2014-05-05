class Guess < ActiveRecord::Base
  belongs_to :game
  has_many :guessed_colors, :inverse_of => :guess
  has_many :colors, :through => :guessed_colors
  accepts_nested_attributes_for :guessed_colors

  validates :game_id, :presence => true
  validates_associated :guessed_colors, :colors

  def last_guessed_colors
    guessed_colors.order("created_at").select("color_id").map(&:color_id)
  end
  
  def target_game_colors
    game.game_colors.order("created_at").select("color_id").map(&:color_id)
  end

  def correct_digits_index
    game_color_values = target_game_colors
    guessed_color_values = last_guessed_colors
    game_color_values.each_index.select{ |i| game_color_values[i] == guessed_color_values[i] }
  end

  def correct_digits_count
    correct_digits_index.count
  end

  def correct_at_wrong_postion_digit_count
    guessed_color_values = last_guessed_colors
    correct_positions = correct_digits_index
    game_color_values = target_game_colors
    
    correct_positions.each{|i| guessed_color_values[i] = '*'}
    game_color_values.each_index.select do |i|
      guessed_color_values[guessed_color_values.index(game_color_values[i])] = '*' if guessed_color_values.include?(game_color_values[i]) && !correct_positions.include?(i)
    end.count
  end
end
