class GuessedColor < ActiveRecord::Base
  belongs_to :guess, :inverse_of => :guessed_colors
  belongs_to :color
  validates :guess, :color_id, :presence => true

  scope :entry_order, -> { order("created_at, id") }
end
