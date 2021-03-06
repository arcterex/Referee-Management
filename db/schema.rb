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

ActiveRecord::Schema.define(:version => 20100408060302) do

  create_table "Fields", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.text     "url"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "club_id"
    t.integer  "area_id"
  end

  create_table "admins", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.boolean  "is_master",  :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "age_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ages", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "areas", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "club_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignments", :force => true do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.integer  "status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "assignor_id"
  end

  create_table "assignors", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "email"
    t.string   "phone"
    t.string   "cell"
    t.string   "username"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bids", :force => true do |t|
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "certifications", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clubs", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "website"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", :force => true do |t|
    t.datetime "gametime"
    t.integer  "field_id"
    t.string   "home"
    t.string   "away"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "level_id"
    t.integer  "age_id"
    t.text     "notes"
    t.boolean  "cup"
    t.string   "gender"
  end

  create_table "level_groups", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "levels", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "certrequired"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "referees", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "email"
    t.date     "dob"
    t.string   "phone"
    t.string   "cell"
    t.string   "username"
    t.string   "password"
    t.integer  "level_id"
    t.text     "notes"
    t.boolean  "available"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "hashed_password"
    t.string   "salt"
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.date     "dob"
    t.string   "phone"
    t.string   "cell"
    t.integer  "level_id"
    t.integer  "role_id"
    t.boolean  "available"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "certification_id"
    t.integer  "age_id"
    t.integer  "club_id"
  end

end
