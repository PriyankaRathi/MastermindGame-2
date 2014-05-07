require 'spec_helper'

describe GuessesController do
  render_views

  describe "#create" do
    let(:game) {games(:game1)} 
    it "creates a new guess" do
      expect {post :create, :game_id => game.id, :guess => 
        {:guessed_colors_attributes => 
          {"0" => {:color_id => 1}, 
           "1" => {:color_id => 1}, 
           "2" => {:color_id => 1}, 
           "3" => {:color_id => 1}
          }
        }}.to change { game.guesses.count }.by(1)
      expect(response).to redirect_to(game_path(game))
    end
  end
end
