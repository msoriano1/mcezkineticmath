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

ActiveRecord::Schema.define(version: 20180922094232) do

  create_table "admins", force: :cascade do |t|
    t.string   "ausername",              default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["ausername"], name: "index_admins_on_ausername", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "answered_worksheets", force: :cascade do |t|
    t.integer  "correctanswer"
    t.integer  "hps"
    t.datetime "dateanswered"
    t.integer  "topic_id"
    t.integer  "yearlevel_id"
    t.integer  "worksheet_id"
    t.integer  "student_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "worksheet_id"
    t.integer  "topic_id"
    t.integer  "yearlevel_id"
    t.integer  "number"
    t.string   "question"
    t.string   "answer"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "image"
  end

  add_index "items", ["topic_id"], name: "index_items_on_topic_id"
  add_index "items", ["worksheet_id"], name: "index_items_on_worksheet_id"
  add_index "items", ["yearlevel_id"], name: "index_items_on_yearlevel_id"

  create_table "studentanswers", force: :cascade do |t|
    t.string   "studentinput"
    t.integer  "topic_id"
    t.integer  "yearlevel_id"
    t.integer  "worksheet_id"
    t.integer  "student_id"
    t.integer  "answered_worksheet_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "susername",              default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.boolean  "status",                 default: true, null: false
    t.string   "firstname",              default: "",   null: false
    t.string   "lastname",               default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "students", ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  add_index "students", ["susername"], name: "index_students_on_susername", unique: true

  create_table "teachers", force: :cascade do |t|
    t.string   "pusername",              default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "firstname",              default: "",   null: false
    t.string   "lastname",               default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.boolean  "status",                 default: true
  end

  add_index "teachers", ["pusername"], name: "index_teachers_on_pusername", unique: true
  add_index "teachers", ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "yearlevel_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "worksheets", force: :cascade do |t|
    t.string   "title"
    t.string   "directions"
    t.integer  "topic_id"
    t.integer  "yearlevel_id"
    t.integer  "admin_id"
    t.integer  "teacher_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "yearlevels", force: :cascade do |t|
    t.integer  "number"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
