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

ActiveRecord::Schema.define(version: 20170131232602) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ar_internal_metadata", primary_key: "key", force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "categorie"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "review_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "decades", force: :cascade do |t|
    t.string "decade"
  end

  create_table "directors", force: :cascade do |t|
    t.date     "birth_date"
    t.date     "death_date"
    t.string   "birth_name"
    t.string   "nickname"
    t.text     "bio"
    t.string   "hometown"
    t.string   "country"
    t.boolean  "also_star",         default: false
    t.boolean  "also_screenwriter", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genres", force: :cascade do |t|
    t.string   "genre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movie_directors", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "director_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movie_genres", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "genre_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movie_screenwriters", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "screenwriter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movie_stars", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "star_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movies", force: :cascade do |t|
    t.string   "original_title"
    t.string   "aka"
    t.string   "IMDB"
    t.string   "length"
    t.string   "color"
    t.decimal  "sum_users_score",     precision: 5, scale: 2
    t.decimal  "sum_critics_score",   precision: 5, scale: 2
    t.decimal  "users_amount_score",  precision: 5, scale: 2
    t.decimal  "critic_amount_score", precision: 5, scale: 2
    t.text     "synopsis"
    t.integer  "decade_id"
    t.integer  "category_id"
    t.integer  "region_id"
    t.string   "poster"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "year"
  end

  create_table "notes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "region"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "user_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "screenwriters", force: :cascade do |t|
    t.date     "birth_date"
    t.date     "death_date"
    t.string   "birth_name"
    t.string   "nickname"
    t.text     "bio"
    t.string   "hometown"
    t.string   "country"
    t.boolean  "also_director", default: false
    t.boolean  "also_star",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stars", force: :cascade do |t|
    t.date     "birth_date"
    t.date     "death_date"
    t.string   "birth_name"
    t.string   "nickname"
    t.text     "bio"
    t.string   "hometown"
    t.string   "country"
    t.boolean  "also_director",     default: false
    t.boolean  "also_screenwriter", default: false
    t.string   "profile_picture"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "gender"
  end

  create_table "user_levels", force: :cascade do |t|
    t.string "level"
  end

  create_table "users", force: :cascade do |t|
    t.date     "birth_date"
    t.string   "birth_name"
    t.string   "nickname"
    t.text     "bio"
    t.string   "hometown"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_level_id", default: 1
  end

end
