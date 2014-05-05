class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :user, :null => false
      t.integer :number_of_guesses, :null => false, :default => 4
      t.integer :color_code_length, :null => false, :default => 4
      t.boolean :allow_duplicates, :null => false, :default => true
      t.timestamps
    end
  end
end
