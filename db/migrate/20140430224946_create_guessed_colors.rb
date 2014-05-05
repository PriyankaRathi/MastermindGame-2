class CreateGuessedColors < ActiveRecord::Migration
  def change
    create_table :guessed_colors do |t|
      t.integer :guess_id, :null => false
      t.integer :color_id, :null => false
      t.index :guess_id
      t.timestamps
    end
  end
end
