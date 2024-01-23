# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_01_19_104444) do
  create_table "artists", primary_key: "artistId", force: :cascade do |t|
    t.integer "userId"
    t.text "first_release_year"
    t.text "no_of_albums"
    t.integer "managerId"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "musics", force: :cascade do |t|
    t.text "musicId"
    t.text "artistId"
    t.text "album"
    t.text "title"
    t.text "genre"
    t.date "releaseDate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", primary_key: "userId", force: :cascade do |t|
    t.text "fname"
    t.text "lname"
    t.text "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "gender"
    t.text "address"
    t.text "dob"
    t.text "password_digest"
    t.text "managerId"
    t.text "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
