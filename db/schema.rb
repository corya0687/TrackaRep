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

ActiveRecord::Schema.define(version: 20161107044726) do

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "workout_id"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drills", force: :cascade do |t|
    t.integer  "run_id"
    t.integer  "weight"
    t.integer  "reps"
    t.integer  "rest_period"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "set_number"
  end

  create_table "exercise_target_muscles", force: :cascade do |t|
    t.integer  "exercise_id"
    t.integer  "target_muscle_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "exercise_translations", force: :cascade do |t|
    t.integer  "exercise_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.string   "description"
  end

  add_index "exercise_translations", ["exercise_id"], name: "index_exercise_translations_on_exercise_id"
  add_index "exercise_translations", ["locale"], name: "index_exercise_translations_on_locale"

  create_table "exercises", force: :cascade do |t|
    t.integer  "reps"
    t.integer  "author_id"
    t.integer  "rest_period"
    t.string   "equipment_needed"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "weight"
    t.integer  "sets"
    t.integer  "rating"
  end

  create_table "muscle_groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plans", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "description"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "runs", force: :cascade do |t|
    t.string   "duration"
    t.string   "type"
    t.integer  "asets"
    t.integer  "areps"
    t.integer  "aweight"
    t.time     "arest"
    t.datetime "completed_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "exercise_id"
    t.integer  "user_id"
    t.integer  "workout_id"
  end

  create_table "target_muscles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timers", force: :cascade do |t|
    t.time     "seconds"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

# Could not dump table "users" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "workout_exercises", force: :cascade do |t|
    t.integer  "exercise_id"
    t.integer  "workout_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "combined_rating"
  end

  create_table "workout_muscle_groups", force: :cascade do |t|
    t.integer  "workout_id"
    t.integer  "muscle_group_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "workout_plans", force: :cascade do |t|
    t.integer  "plan_id"
    t.integer  "workout_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workout_translations", force: :cascade do |t|
    t.integer  "workout_id",  null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.string   "description"
  end

  add_index "workout_translations", ["locale"], name: "index_workout_translations_on_locale"
  add_index "workout_translations", ["workout_id"], name: "index_workout_translations_on_workout_id"

  create_table "workouts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "author_id"
  end

end
