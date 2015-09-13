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

ActiveRecord::Schema.define(version: 20150913021142) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "scrobbles", force: :cascade do |t|
    t.date     "time"
    t.string   "track_name"
    t.string   "artist_name"
    t.string   "album_name"
    t.string   "application"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "unixtime"
    t.string   "track_mbid"
    t.string   "artist_mbid"
    t.string   "uncorrected_track_name"
    t.string   "uncorrected_track_mbid"
    t.string   "uncorrected_artist_name"
    t.string   "uncorrected_artist_mbid"
    t.string   "album_mbid"
    t.string   "album_artist_name"
    t.string   "album_artist_mbid"
  end

end
