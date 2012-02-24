class AddIndexRegNumToCars < ActiveRecord::Migration
  def self.up
	add_index :cars, :regNum, :unique => true
  end

  def self.down
	remove_index :cars, :regNum
  end
end
