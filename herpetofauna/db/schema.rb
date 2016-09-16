# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160916204459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "herp_taxons", force: :cascade do |t|
    t.text "code"
    t.text "common_name"
    t.text "scientific_name"
  end

  create_table "location_histories", force: :cascade do |t|
    t.integer "plot_locations_id"
    t.float   "lat_north"
    t.float   "long_north"
    t.float   "lat_south"
    t.float   "long_south"
    t.date    "begin_date"
    t.float   "begin_date_month"
    t.float   "begin_date_year"
    t.date    "end_date"
    t.float   "end_date_month"
    t.float   "end_date_year"
    t.text    "location_histories_notes"
  end

  create_table "observers", force: :cascade do |t|
    t.integer "sampling_event_id"
    t.integer "persons_id"
  end

  create_table "persons", force: :cascade do |t|
    t.text "last_name"
    t.text "first_name"
    t.text "initials"
  end

  create_table "plot_locations", force: :cascade do |t|
    t.integer "river_reaches_id"
    t.text    "transect"
    t.text    "location"
  end

  create_table "river_reaches", force: :cascade do |t|
    t.text "reach"
    t.text "urbanized"
    t.text "restored"
    t.text "water"
  end

  create_table "sampling_events", force: :cascade do |t|
    t.integer  "river_reaches_id"
    t.datetime "observation_date"
    t.text     "sampling_events_notes"
  end

  create_table "sampling_events_observations", force: :cascade do |t|
    t.integer "sampling_event_id"
    t.integer "herp_taxons_id"
    t.float   "quantity"
    t.text    "sampling_events_observation_notes"
  end

  create_table "surveys", force: :cascade do |t|
    t.integer "sampling_event_id"
    t.integer "plot_locations_id"
    t.time    "time_start"
    t.time    "time_end"
    t.text    "surveys_notes"
  end

  create_table "surveys_observations", force: :cascade do |t|
    t.integer "surveys_id"
    t.integer "herp_taxons_id"
    t.float   "quantity"
    t.text    "surveys_observation_notes"
  end

  create_table "whole_transect_histories", force: :cascade do |t|
    t.integer "river_reaches_id"
    t.text    "transect"
    t.text    "bearing_0"
    t.text    "bearing_1"
    t.float   "lat_north"
    t.float   "long_north"
    t.float   "lat_south"
    t.float   "long_south"
    t.date    "begin_date"
    t.integer "begin_date_month"
    t.integer "begin_date_year"
    t.date    "end_date"
    t.integer "end_date_month"
    t.integer "end_date_year"
    t.text    "wth_notes"
  end

  add_foreign_key "location_histories", "plot_locations", column: "plot_locations_id", name: "location_histories_fk_plot_locations"
  add_foreign_key "observers", "persons", column: "persons_id", name: "observers_fk_persons"
  add_foreign_key "observers", "sampling_events", name: "observers_fk_sampling_events"
  add_foreign_key "plot_locations", "river_reaches", column: "river_reaches_id", name: "plot_locations_fk_river_reaches"
  add_foreign_key "sampling_events", "river_reaches", column: "river_reaches_id", name: "sampling_events_fk_river_reaches"
  add_foreign_key "sampling_events_observations", "herp_taxons", column: "herp_taxons_id", name: "sampling_events_observations_fk_herp_taxons"
  add_foreign_key "sampling_events_observations", "sampling_events", name: "sampling_events_observations_fk_sampling_events"
  add_foreign_key "surveys", "sampling_events", name: "surveys_fk_sampling_events"
  add_foreign_key "surveys_observations", "herp_taxons", column: "herp_taxons_id", name: "surveys_observations_fk_herp_taxons"
  add_foreign_key "surveys_observations", "surveys", column: "surveys_id", name: "surveys_observations_fk_survyes"
  add_foreign_key "whole_transect_histories", "river_reaches", column: "river_reaches_id", name: "whole_transect_histories_fk_river_reaches"
end
