class CreateDrivers < ActiveRecord::Migration
  def self.up
    create_table :drivers do |t|
      t.string :fname
      t.string :lname
      t.string :gender
      t.string :mobileNum

      t.timestamps
    end
  end

  def self.down
    drop_table :drivers
  end
end
