class GuessedColor < ActiveRecord::Base
  belongs_to :guess, :inverse_of => :guessed_colors
  belongs_to :color
  validates :guess, :color_id, :presence => true
end
