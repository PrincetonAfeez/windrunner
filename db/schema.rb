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

ActiveRecord::Schema.define(:version => 20111024084821) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "parent_id"
    t.string   "status",      :default => "Active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["name", "status"], :name => "index_categories_on_name_and_status"

  create_table "line_items", :force => true do |t|
    t.integer  "product_id",                                :null => false
    t.integer  "order_id",                                  :null => false
    t.integer  "quantity",                                  :null => false
    t.decimal  "total_price", :precision => 8, :scale => 2, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "receiver"
    t.string   "email"
    t.string   "status",     :default => "Active"
    t.string   "pay_type"
    t.string   "creditcard"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["name", "email", "pay_type"], :name => "index_orders_on_name_and_email_and_pay_type"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "unique"
    t.text     "description"
    t.string   "image_url",     :default => "No image"
    t.float    "cost",          :default => 0.0
    t.float    "price",         :default => 0.0
    t.float    "special_price", :default => 0.0
    t.float    "member_price",  :default => 0.0
    t.string   "status",        :default => "Active"
    t.integer  "quantity",      :default => 0
    t.integer  "category_id",                           :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["name", "status"], :name => "index_products_on_name_and_status"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "hashed_password"
    t.string   "salt"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "membership",      :default => "Normal"
    t.string   "status",          :default => "Active"
    t.string   "sex",             :default => "Male"
    t.string   "filename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["username", "status", "membership"], :name => "index_users_on_username_and_status_and_membership"

end
