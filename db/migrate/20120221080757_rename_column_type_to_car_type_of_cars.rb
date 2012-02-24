class RenameColumnTypeToCarTypeOfCars < ActiveRecord::Migration
  def self.up
	rename_column :cars, :type, :carType
  end

  def self.down
	add_column :cars, :type, :string
  end
end
