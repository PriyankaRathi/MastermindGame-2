class CreateGameColors < ActiveRecord::Migration
  def change
    create_table :game_colors do |t|
      t.integer :game_id, :null => false
      t.integer :color_id, :null => false
      t.index :game_id
      t.timestamps
    end
  end
end
