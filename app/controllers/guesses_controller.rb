class GuessesController < ApplicationController
  def create
    game = Game.find(params[:game_id])
    guess = game.guesses.build(guess_params)

    flash[:error] = guess.errors.full_messages.to_sentence unless game.save
    redirect_to game  
  end

  private
    def guess_params
      params.require(:guess).permit(guessed_colors_attributes: [:id, :color_id])
    end
end
