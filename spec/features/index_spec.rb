require 'spec_helper'

describe "index page" do
  it "should contain" do
    visit root_path
    page.should have_content('Name')
    page.should have_content('Select number of guesses')
    page.should have_content('Select color scheme length')
    page.should have_content('Allow Duplicates')
  end

  it "should create new game" do
    visit root_path
    fill_in 'game_user', :with => "Priyanka"
    select(8, :from => 'game_number_of_guesses')
    select(4, :from => 'game_color_code_length')
    uncheck('game_allow_duplicates')
    click_button('Start Game')
    expect(page).to have_content 'Enter your guess:'
  end

  it "should create not create new game" do
    visit root_path
    fill_in 'game_user', :with => "12"
    select(8, :from => 'game_number_of_guesses')
    select(4, :from => 'game_color_code_length')
    uncheck('game_allow_duplicates')
    click_button('Start Game')
    expect(page).to have_content 'User is invalid'
  end

  it "should create new game" do
    visit root_path
    fill_in 'game_user', :with => "Priyanka"
    click_button('Start Game')
    expect(page).to have_content 'Enter your guess:'
  end
end