require 'spec_helper'

describe GamesController do
  render_views

  shared_examples_for "all pages" do
    subject { get template }
    it { should be_success }
    it { should render_template(template) }
  end

  describe "#index" do
    let(:template) {"index"}
    
    context "when used only / renders index" do
      it_should_behave_like "all pages"
      it { expect(response.status).to eq(200) }
    end

    context "when used /games renders index template" do
      it_should_behave_like "all pages"
    end
    
  end

  describe "#create" do
    it "creates a new game" do
      expect { post :create, :game => { :user => "Priyanka", :number_of_guesess => 4, :color_code_length => 4, :allow_duplicates => true } }.to change { Game.count }.by(1)

      game = Game.last
      expect(response).to redirect_to(game_path(game))
    end
  end

  describe "#show" do
    let(:game) { games(:game1) }

    it "renders a game in progress" do
      get :show, :id => game.id
      expect(response).to render_template("show")
    end

    context "when game won" do
      let(:game) { games(:game2) }

      it "should render to won" do
        get :show, :id => game.id
        expect(response).to render_template('_won')
      end
    end

    context "when game lost" do
      let(:game) { games(:game3) }

      it "should render to won" do
        get :show, :id => game.id
        expect(response).to render_template('_lost')
      end
    end
  end
end
