# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_21_080941) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "babyclasses", force: :cascade do |t|
    t.string "nursery_class"
    t.string "class_pic"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "child_teachers", force: :cascade do |t|
    t.bigint "child_id", null: false
    t.bigint "teacher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["child_id"], name: "index_child_teachers_on_child_id"
    t.index ["teacher_id"], name: "index_child_teachers_on_teacher_id"
  end

  create_table "children", force: :cascade do |t|
    t.string "name"
    t.string "child_pic"
    t.boolean "gender"
    t.date "birthday"
    t.string "email"
    t.string "address"
    t.integer "tel"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "babyclass_id"
    t.index ["babyclass_id"], name: "index_children_on_babyclass_id"
  end

  create_table "class_teachers", force: :cascade do |t|
    t.bigint "babyclass_id", null: false
    t.bigint "teacher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["babyclass_id"], name: "index_class_teachers_on_babyclass_id"
    t.index ["teacher_id"], name: "index_class_teachers_on_teacher_id"
  end

  create_table "dashboards", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.string "parent_sign"
    t.string "admin_sign"
    t.integer "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "teacher_pic"
    t.boolean "gender"
    t.string "email"
    t.string "address"
    t.integer "tel"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "child_teachers", "children"
  add_foreign_key "child_teachers", "teachers"
  add_foreign_key "class_teachers", "babyclasses"
  add_foreign_key "class_teachers", "teachers"
end
