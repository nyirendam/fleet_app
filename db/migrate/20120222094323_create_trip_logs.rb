class CreateTripLogs < ActiveRecord::Migration
  def self.up
    create_table :trip_logs do |t|
      t.date :tripDate
      t.string :locationFrom
      t.string :locationTo
      t.time :departureTime
      t.time :arrivalTime
      t.integer :mileageFrom
      t.integer :mileageTo
      t.references :car
      t.references :driver

      t.timestamps
    end
  end

  def self.down
    drop_table :trip_logs
  end
end
