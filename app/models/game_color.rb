class GameColor < ActiveRecord::Base
  belongs_to :game, :inverse_of => :game_colors
  belongs_to :color
  validates :game_id, :color_id, :presence => true

  scope :entry_order, -> { order("created_at, id") }
end
