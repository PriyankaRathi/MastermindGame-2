class GamesController < ApplicationController
  def index
    @game = Game.new
  end

  def create
    @game = Game.new(params[:game].permit(:user, :number_of_guesses, :color_code_length, :allow_duplicates))
    if @game.save
      redirect_to @game
    else
      render 'index'
    end
  end

  def show
    @game = Game.find(params[:id])
    if @game.won?
      render 'won'
    elsif @game.lost?
      render 'lost'
    else
      @guess = @game.guesses.build
      @game.color_code_length.times do
        @guess.guessed_colors.build
      end
    end
  end
end
