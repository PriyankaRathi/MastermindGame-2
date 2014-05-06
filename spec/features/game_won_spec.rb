require 'spec_helper'

describe "Game" do
  let(:game) { games(:game5) }
  before {visit game_path(game)}

  it "should start new game" do
    expect(page).to have_content 'Enter your guess:'
  end

  it "when 1st guess entered should display game in progress" do
    submit_guess %w{Blue Blue Blue Red}

    within(first(:xpath, "//table[@id = 'tbl_progress']/tr")) do
      expect(page).to have_selector('p', :text => '1 color is correct. 1 color is correct but at wrong positon.')
    end
    expect(page).to have_content 'You have 3 guesses left.'
  end

  it "when 2nd guess entered should display game in progress" do
    submit_guess %w{Blue Blue Blue Red}
    submit_guess %w{Red Blue Green Green}

    within(first(:xpath, "//table[@id = 'tbl_progress']/tr")) do
      expect(page).to have_selector('p', :text => '3 colors are correct. 0 color is correct but at wrong positon.')
    end
    expect(page).to have_content 'You have 2 guesses left.'
  end

  it "should display that game is won" do
    submit_guess %w{Blue Blue Blue Red}
    submit_guess %w{Red Blue Green Green}
    submit_guess %w{Red Blue Green Yellow}

    within(first(:xpath, "//table[@id = 'tbl_progress']/tr")) do
      expect(page).to have_selector('p', :text => '4 colors are correct. 0 color is correct but at wrong positon.')
    end
    expect(page).to have_content 'Hurrey... ! You won the game'
    expect(page).to have_link 'New Game'
    page.click_link('New Game')
    expect(page).to have_content 'Mastermind Game'
  end
end