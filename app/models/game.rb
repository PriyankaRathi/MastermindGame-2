class Game < ActiveRecord::Base
  has_many :guesses
  has_many :guessed_colors, :through => :guesses
  has_many :game_colors, :inverse_of => :game
  has_many :colors, :through => :game_colors

  validates :user, :number_of_guesses, :color_code_length, :presence => true
  validates :number_of_guesses, :color_code_length, :format => { :with => /\A\d+\z/ }
  validates :user, :format => { :with => /\A[A-z]\w+\z/ }
  validates_associated :game_colors, :colors

  before_create :build_game_colors

  def pick_target_game_colors
    if allow_duplicates
      color_code_length.times.map { Color.all_colors.sample }
    else
      Color.all_colors.sample(color_code_length)
    end
  end

  def build_game_colors
    pick_target_game_colors.each do |target_game_color|
      game_colors.build(:color_id => target_game_color)
    end
  end
  
  def latest_guess
    guesses.entry_order.last
  end

  def target_game_colors
    game_colors.entry_order.select("color_id").map(&:color_id)
  end

  def won?
    target_game_colors == latest_guess.last_guessed_colors if latest_guess
  end

  def lost?
    number_of_guesses == guesses(true).length && !won?
  end

  def guesses_left
    number_of_guesses - guesses(true).length
  end
end
