class AddColumnEmployeeIdToDrivers < ActiveRecord::Migration
  def self.up
	add_column :drivers, :employeeId, :string
  end

  def self.down
	remove_column :drivers, :employeeId
  end
end
