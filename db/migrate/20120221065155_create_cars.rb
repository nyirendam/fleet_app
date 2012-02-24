class CreateCars < ActiveRecord::Migration
  def self.up
    create_table :cars do |t|
      t.string :regNum
      t.string :model
      t.string :type
      t.string :colour

      t.timestamps
    end
  end

  def self.down
    drop_table :cars
  end
end
