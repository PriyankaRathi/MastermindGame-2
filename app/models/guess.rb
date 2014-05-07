class Guess < ActiveRecord::Base
  belongs_to :game
  has_many :guessed_colors, :inverse_of => :guess
  has_many :colors, :through => :guessed_colors
  accepts_nested_attributes_for :guessed_colors

  validates :game_id, :presence => true
  validates_associated :guessed_colors, :colors

  scope :entry_order, -> { order("created_at") }

  def last_guessed_colors
    guessed_colors.entry_order.select("color_id").map(&:color_id)
  end

  def correct_digits_index
    game.target_game_colors.each_with_index.collect { |target_color, index| index if target_color == last_guessed_colors[index] }.compact
  end

  def correct_at_wrong_postion_digit_count
    guessed_color_values = last_guessed_colors
    digit_count = 0
    
    correct_digits_index.each {|index| guessed_color_values[index] = nil }

    game.target_game_colors.each_with_index do |game_color_value, index|
      match_index = guessed_color_values.index(game_color_value)
      
      if match_index && !correct_digits_index.include?(index)
        guessed_color_values[match_index] = nil
        digit_count += 1
      end
    end
    digit_count
  end

  def build_guessed_colors
    game.color_code_length.times do
      guessed_colors.build
    end
  end
end
