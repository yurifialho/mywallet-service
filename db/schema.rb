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

ActiveRecord::Schema.define(version: 2019_05_17_143401) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categorias", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contas", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lancamentos", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.float "valor"
    t.datetime "data"
    t.bigint "categoria_id"
    t.bigint "tipo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "conta_id"
    t.index ["categoria_id"], name: "index_lancamentos_on_categoria_id"
    t.index ["conta_id"], name: "index_lancamentos_on_conta_id"
    t.index ["tipo_id"], name: "index_lancamentos_on_tipo_id"
  end

  create_table "tipos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "lancamentos", "categorias"
  add_foreign_key "lancamentos", "contas"
  add_foreign_key "lancamentos", "tipos"
end
