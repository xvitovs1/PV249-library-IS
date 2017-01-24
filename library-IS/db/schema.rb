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

ActiveRecord::Schema.define(version: 20170124113328) do

  create_table "authors", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.integer  "author_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["author_id"], name: "index_books_on_author_id"
  end

  create_table "borrows", force: :cascade do |t|
    t.date     "borrow_date"
    t.date     "expected_return_date"
    t.date     "return_date"
    t.integer  "reader_id"
    t.integer  "publication_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["publication_id"], name: "index_borrows_on_publication_id"
    t.index ["reader_id"], name: "index_borrows_on_reader_id"
  end

  create_table "publications", force: :cascade do |t|
    t.string   "ISBN"
    t.integer  "year"
    t.integer  "publisher_id"
    t.string   "img_url"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "book_id"
    t.boolean  "borrowed",     default: false
    t.index ["ISBN"], name: "index_publications_on_ISBN", unique: true
    t.index ["book_id"], name: "index_publications_on_book_id"
    t.index ["publisher_id"], name: "index_publications_on_publisher_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "readers", force: :cascade do |t|
    t.string   "card_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "reader_id"
    t.index ["reader_id"], name: "index_users_on_reader_id"
  end

end
