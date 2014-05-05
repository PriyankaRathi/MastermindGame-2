class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :color_name, :null => false
      t.timestamps
    end
  end
end
