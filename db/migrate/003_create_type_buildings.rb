class CreateTypeBuildings < ActiveRecord::Migration
  def self.up
    create_table :type_buildings do |t|
      t.string :name
      t.text :body
      t.timestamps
    end
  end

  def self.down
    drop_table :type_buildings
  end
end
