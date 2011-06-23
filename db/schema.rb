# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110622214009) do

  create_table "countries", :force => true do |t|
    t.string "name"
  end

  create_table "festivals", :force => true do |t|
    t.integer "year"
  end

  create_table "festivals_roles", :id => false, :force => true do |t|
    t.integer  "role_id",     :null => false
    t.integer  "festival_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string  "name_en"
    t.string  "name_no"
    t.integer "section_id"
    t.integer "festival_id"
    t.string  "email",          :limit => 1000
    t.string  "tag",                            :null => false
    t.text    "description_en"
    t.text    "description_no"
  end

  create_table "groups_positions", :id => false, :force => true do |t|
    t.integer "group_id"
    t.integer "position_id"
  end

  create_table "groups_roles", :id => false, :force => true do |t|
    t.integer  "role_id",    :null => false
    t.integer  "group_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", :force => true do |t|
    t.string  "title_en"
    t.string  "title_no"
    t.integer "user_id"
    t.text    "description_en"
    t.text    "description_no"
    t.string  "group_dn"
    t.integer "admission_id"
    t.integer "group_id"
    t.integer "number",         :default => 1, :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_sections", :id => false, :force => true do |t|
    t.integer  "role_id",    :null => false
    t.integer  "section_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", :force => true do |t|
    t.string  "name_en"
    t.string  "name_no"
    t.integer "festival_id"
    t.string  "email",          :limit => 1000
    t.string  "tag",                            :null => false
    t.text    "description_en"
    t.text    "description_no"
  end

  create_table "study_places", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "given_name"
    t.string   "family_name"
    t.date     "date_of_birth"
    t.integer  "gender"
    t.string   "phone"
    t.string   "address"
    t.integer  "postal_code"
    t.integer  "country_id"
    t.string   "next_of_kin_name"
    t.string   "next_of_kin_tlf"
    t.text     "tasks"
    t.string   "study"
    t.integer  "study_place_id"
    t.string   "private_email"
    t.integer  "cardnumber_ntnu"
    t.integer  "cardnumber_samfundet"
    t.string   "city"
    t.string   "username"
    t.integer  "ldap_id"
    t.string   "profile_picture_file_name"
    t.string   "profile_picture_content_type"
    t.integer  "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
    t.integer  "has_skies"
    t.integer  "shoe_size"
    t.integer  "have_group_card"
    t.text     "media_contacts"
    t.string   "local_paper"
    t.integer  "vegetarian",                   :limit => 1
    t.integer  "lactose_allergy",              :limit => 1
    t.integer  "gluten_allergy",               :limit => 1
    t.integer  "nut_allergy",                  :limit => 1
    t.integer  "fruit_allergy",                :limit => 1
    t.text     "other_allergy"
    t.integer  "no_allergy",                   :limit => 1
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users_positions", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "position_id", :null => false
  end

  create_table "users_role_abstractions", :id => false, :force => true do |t|
    t.integer  "role_id",    :null => false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer  "role_id",    :null => false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
