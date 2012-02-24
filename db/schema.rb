# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120223093041) do

  create_table "cars", :force => true do |t|
    t.string   "regNum"
    t.string   "model"
    t.string   "carType"
    t.string   "colour"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cars", ["regNum"], :name => "index_cars_on_regNum", :unique => true

  create_table "drivers", :force => true do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "gender"
    t.string   "mobileNum"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "employeeId"
  end

  create_table "trip_logs", :force => true do |t|
    t.date     "tripDate"
    t.string   "locationFrom"
    t.string   "locationTo"
    t.time     "departureTime"
    t.time     "arrivalTime"
    t.integer  "mileageFrom"
    t.integer  "mileageTo"
    t.integer  "car_id"
    t.integer  "driver_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "fname"
    t.string   "lname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "hashed_password"
    t.string   "salt"
  end

  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
