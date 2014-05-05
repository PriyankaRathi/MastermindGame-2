class Game < ActiveRecord::Base
  has_many :guesses
  has_many :guessed_colors, :through => :guesses
  has_many :game_colors, :inverse_of => :game
  has_many :colors, :through => :game_colors

  validates :user, :number_of_guesses, :color_code_length, :presence => true
  validates :number_of_guesses, :color_code_length, :format => { :with => /\A\d+\Z/ }
  validates :user, :format => { :with => /\A[A-z]\w+\Z/ }
  validates_associated :game_colors, :colors

  before_create :build_game_colors

  def pick_target_game_colors
    guess_num = []
    colors_array = Color.all_colors
    if allow_duplicates
      color_code_length.times do 
        guess_num << colors_array[rand(0...colors_array.length)]
      end
    else
      guess_num = colors_array.sample(color_code_length)
    end
    guess_num
  end

  def build_game_colors
    if game_colors.count == 0
      target_colors = pick_target_game_colors
      target_colors.each do |target_game_color|
        game_colors.build(:color_id => target_game_color)
      end
    end
  end
  
  def latest_guess
    guesses.order("created_at").last
  end

  def target_game_colors
    game_colors.order("created_at").select("color_id").map(&:color_id)
  end

  def last_guessed_colors
    latest_guess.guessed_colors.order("created_at").select("color_id").map(&:color_id) if guessed_colors.count > 0
  end

  def won?
    target_game_colors == last_guessed_colors
  end

  def lost?
    number_of_guesses == guesses.count && !won?
  end

  def guesses_left
    number_of_guesses - guesses.count
  end
end
