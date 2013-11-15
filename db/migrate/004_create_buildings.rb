class CreateBuildings < ActiveRecord::Migration
  def self.up
    create_table :buildings do |t|
      t.string :title
      t.references :type_building
      t.text :body
      t.string :direction
      t.integer :number
      t.timestamps
    end
  end

  def self.down
    drop_table :buildings
  end
end
