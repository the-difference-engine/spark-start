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

ActiveRecord::Schema.define(version: 20170519012557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "author_categories", force: :cascade do |t|
    t.integer  "author_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "authors", force: :cascade do |t|
    t.string   "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "book_id"
  end

  create_table "authors_books", force: :cascade do |t|
    t.integer  "author_id"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string   "url"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "user_id"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.string   "title"
    t.text     "description"
    t.string   "ebook_file_name"
    t.string   "ebook_content_type"
    t.integer  "ebook_file_size"
    t.datetime "ebook_updated_at"
    t.integer  "book_downloads",     default: 0
    t.integer  "max_downloads"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_author_books", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categorized_posts", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "chats", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "approved",         default: false
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.text     "body"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "experience"
    t.text     "bio"
    t.string   "phone"
    t.string   "career"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "state"
    t.string   "city"
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "linkedin_url"
  end

  create_table "tagged_posts", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "tag_name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "token"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "email"
    t.boolean  "admin",      default: false
  end

end
